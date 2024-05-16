abstract class AuthDatasource {
  Future<bool> loginWithGoogle();
  Future<bool> loginWithDiscord();
  Future<bool> loginWithGithub();
  Future<bool> loginAnonymous(String name);
}
