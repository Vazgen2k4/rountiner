import 'package:rountiner/features/auth/data/models/user_model.dart';

abstract interface class AuthStrategy {
  Future<UserModel?> signIn();
  Future<UserModel?> signUp();
  Future<void> signOut();
}
