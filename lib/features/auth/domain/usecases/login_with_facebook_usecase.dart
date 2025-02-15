import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/facebook_auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';

class LoginWithFacebookUsecase {
  final AuthRepository _authRepository;

  const LoginWithFacebookUsecase(this._authRepository);

  Future<UserModel?> call() async {
    _authRepository.setAuthStrategy(FacebookAuthStrategy());
    return await _authRepository.signIn();
  }
}
