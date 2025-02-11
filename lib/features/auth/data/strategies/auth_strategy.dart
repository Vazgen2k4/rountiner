import 'package:rountiner/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthStrategy {
  Future<UserEntity?> signIn();
  Future<UserEntity?> signUp();
  Future<void> signOut();
}
