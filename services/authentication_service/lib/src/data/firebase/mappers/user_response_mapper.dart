import 'package:common_dependencies/common_dependencies.dart';

import '../../../domain/models/authenticated_user.dart';

class UserResponseMapper {
  static AuthenticatedUser map(UserCredential? userCredential) {
    if (userCredential == null || userCredential.user == null) {
      return throw Exception('Invalid firebase userCredential.');
    }

    return AuthenticatedUser(
      displayName: userCredential.user!.displayName!,
      email: userCredential.user!.email!,
      uid: userCredential.user!.uid,
    );
  }
}
