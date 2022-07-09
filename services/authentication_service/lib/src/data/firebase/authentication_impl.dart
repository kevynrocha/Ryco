import 'package:common_dependencies/common_dependencies.dart';

import '../../authentication.dart';
import '../../domain/models/authenticated_user.dart';
import 'mappers/user_response_mapper.dart';

class AuthenticationImpl implements Authentication {
  const AuthenticationImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firebaseCrashlytics,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseCrashlytics firebaseCrashlytics;

  @override
  Future<AuthenticatedUser?> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // // Once signed in, return the UserCredential
      final userCredentials =
          await firebaseAuth.signInWithCredential(credential);

      return UserResponseMapper.map(userCredentials);
    } on Exception catch (exception, stack) {
      await firebaseCrashlytics.recordError(exception, stack);
      rethrow;
    }
  }

  @override
  Future signOut() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } on Exception catch (exception, stack) {
      await firebaseCrashlytics.recordError(exception, stack);
    }
  }
}
