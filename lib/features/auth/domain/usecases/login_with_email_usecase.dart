import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/data/strategies/auth/email_and_password_auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';

class LoginWithEmailUsecase {
  final AuthRepository _authRepository;

  const LoginWithEmailUsecase(this._authRepository);

  Future<UserModel?> call(String email, String password) async {
    _authRepository.setAuthStrategy(
      EmailAndPasswordAuthStrategy(email, password),
    );

    return await _authRepository.signIn();
  }
}
