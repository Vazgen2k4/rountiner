import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';

class FacebookAuthStrategy implements AuthStrategy {
  @override
  Future<UserModel?> signIn(UserRepository userRepository) async {
    try {
      final result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        log('Facebook login failed: ${result.status}');
        return null;
      }

      if (result.accessToken == null) {
        log('Facebook token is null');
        return null;
      }

      final facebookCredential = FacebookAuthProvider.credential(
        result.accessToken!.token,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        facebookCredential,
      );
      final user = userCredential.user;

      if (user == null) {
        log('Firebase user is null');
        return null;
      }

      return await userRepository.getOrCreateUser(user);
    } catch (e) {
      log('Error during Facebook login: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await FacebookAuth.instance.logOut();
  }
}
