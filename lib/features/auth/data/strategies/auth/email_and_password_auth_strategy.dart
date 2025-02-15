import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';

class EmailAndPasswordAuthStrategy implements AuthStrategy {
  final String email;
  final String password;

  EmailAndPasswordAuthStrategy(this.email, this.password);

  @override
  Future<UserModel?> signIn(userRepository) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        final newCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        credential = newCredential;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }

    return await userRepository.getOrCreateUser(credential?.user);
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
