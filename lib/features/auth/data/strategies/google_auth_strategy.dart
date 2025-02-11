import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth_strategy.dart';

class GoogleAuthStrategy implements AuthStrategy {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<UserModel?> signIn() async {
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount == null) {
      log('Google account is null');
      return null;
    }

    final googleAuth = await googleAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final user = userCredential.user;

    if (user == null) {
      log('User is null');
      return null;
    }

    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      goals: [],
    );
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
