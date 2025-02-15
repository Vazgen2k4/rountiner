import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';
import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRepository userRepository;
  AuthStrategy _strategy;

  AuthRepositoryImpl({
    required AuthStrategy strategy,
    required this.userRepository,
  }) : _strategy = strategy;

  @override
  Future<void> signOut() {
    return _strategy.signOut();
  }

  @override
  Future<UserModel?> signIn() {
    return _strategy.signIn(userRepository);
  }

  @override
  void setAuthStrategy(AuthStrategy strategy) {
    _strategy = strategy;
  }
}
