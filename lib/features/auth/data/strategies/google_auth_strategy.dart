import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rountiner/features/auth/domain/entities/user_entity.dart';
import 'package:rountiner/features/auth/data/strategies/auth_strategy.dart';

class GoogleAuthStrategy implements AuthStrategy {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<UserEntity?> signIn() async {
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
    
    

    // return ;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
