abstract interface class AuthRepository<Params> {
  Future<void> signIn();
  Future<void> signUp();
  Future<void> signOut();
}
