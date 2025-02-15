import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';

class GoogleAuthStrategy implements AuthStrategy {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<UserModel?> signIn(userRepository) async {
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount == null) {
      log('Google account is null');
      return null;
    }

    final googleAuth = await googleAccount.authentication;
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final credential = await FirebaseAuth.instance.signInWithCredential(
      googleCredential,
    );

    return await userRepository.getOrCreateUser(credential.user);
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
