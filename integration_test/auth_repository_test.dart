import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rountiner/features/auth/data/datasources/user/firestore_user_data_source.dart';
import 'package:rountiner/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rountiner/features/auth/data/repositories/user_repository_impl.dart';
import 'package:rountiner/features/auth/data/strategies/auth/google_auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';

import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';

import 'package:rountiner/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:rountiner/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:rountiner/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:rountiner/features/auth/domain/usecases/login_with_facebook_usecase.dart';

void main() {
  late AuthRepository authRepository;
  late UserRepository userRepository;
  late LoginWithEmailUsecase loginWithEmailUsecase;
  late LoginWithGoogleUsecase loginWithGoogleUsecase;
  late LoginWithFacebookUsecase loginWithFacebookUsecase;
  late LogOutUsecase logOutUsecase;

  setUp(() async {
    log('setUp');
    if (Firebase.apps.isEmpty) {
      log('Firebase.initializeApp start');
      await Firebase.initializeApp(
        name: 'Auth Tests',
        options: FirebaseOptions(
          apiKey: 'test',
          appId: 'test',
          trackingId: 'test',
          messagingSenderId: 'test',
          projectId: 'test',
        ),
      );
      log('Firebase.initializeApp end');
    }

    log('useAuthEmulator start');
    await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
    log('useAuthEmulator end');

    log('useFirestoreEmulator start');
    FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
    log('useFirestoreEmulator end');

    userRepository = UserRepositoryImpl(FirestoreUserDataSource());
    authRepository = AuthRepositoryImpl(
      strategy: GoogleAuthStrategy(),
      userRepository: userRepository,
    );

    // Инициализация юзкейсов
    loginWithEmailUsecase = LoginWithEmailUsecase(authRepository);
    loginWithGoogleUsecase = LoginWithGoogleUsecase(authRepository);
    loginWithFacebookUsecase = LoginWithFacebookUsecase(authRepository);
    logOutUsecase = LogOutUsecase(authRepository);
  });

  tearDown(() async {
    // Очистка данных после каждого теста
    await FirebaseAuth.instance.signOut();
  });

  group('Auth Usecases tests', () {
    test('auth with email and password', () async {
      final email = 'test@gmail.com';
      final password = 'asdf1234';

      try {
        final user = await loginWithEmailUsecase(email, password);
        expect(user, isNotNull);
        expect(user!.email, email);
      } catch (e) {
        fail('Ошибка входа: $e');
      }
    });

    test('auth with Google', () async {
      try {
        final user = await loginWithGoogleUsecase();
        expect(user, isNotNull);
        expect(user!.email, isNotNull);
      } catch (e) {
        fail('Ошибка входа через Google: $e');
      }
    });
    
    test('sign out', () async {
      final email = 'test@gmail.com';
      final password = 'asdf1234';
      await loginWithEmailUsecase(email, password);
      final currentUser = await authRepository.signIn();

      expect(currentUser, isNotNull);
      expect(FirebaseAuth.instance.currentUser, isNotNull);

      await logOutUsecase.call();
      expect(FirebaseAuth.instance.currentUser, isNull);
    });
  });
}
