import 'package:rountiner/features/auth/domain/repositories/auth_repository.dart';

class LogOutUsecase {
  final AuthRepository _authRepository;

  const LogOutUsecase(this._authRepository);

  Future<void> call() async {
    return await _authRepository.signOut();
  }
}
