import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/domain/entities/user_entity.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';
import 'package:rountiner/features/auth/data/strategies/auth_strategy.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthStrategy authStrategy;
  AuthRepositoryImpl(this.authStrategy);

  @override
  Future<UserModel?> signIn() async {
    return await authStrategy.signIn();
  }

  @override
  Future<void> signOut() async {
    await authStrategy.signOut();
  }

  @override
  Future<void> signUp() {
    throw UnimplementedError();
  }
  
  void setStrategy(AuthStrategy strategy) {
    authStrategy = strategy;
  }
  
}