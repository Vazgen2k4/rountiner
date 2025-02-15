import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';

abstract interface class AuthRepository {
  Future<UserModel?> signIn();
  Future<void> signOut();

  void setAuthStrategy(AuthStrategy strategy);
}
