import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/google_auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogleUsecase {
  final AuthRepository _authRepository;

  const LoginWithGoogleUsecase(this._authRepository);

  Future<UserModel?> call() async {
    _authRepository.setAuthStrategy(GoogleAuthStrategy());
    return await _authRepository.signIn();
  }
}
