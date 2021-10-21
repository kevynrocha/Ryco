import 'domain/models/authenticated_user.dart';

abstract class Authentication {
  Future<AuthenticatedUser?> signIn();
  Future<void> signOut();
}
