import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';

abstract interface class AuthStrategy {
  Future<UserModel?> signIn(UserRepository userRepository);
  Future<void> signOut();
}
