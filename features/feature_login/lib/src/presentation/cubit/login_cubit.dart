import 'package:authentication_service/authentication_service.dart';
import 'package:common_dependencies/common_dependencies.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required FirebaseCrashlytics firebaseCrashlytics,
    required Authentication authentication,
  })  : _firebaseCrashlytics = firebaseCrashlytics,
        _authentication = authentication,
        super(LoginLoadInProgress());

  final FirebaseCrashlytics _firebaseCrashlytics;
  final Authentication _authentication;

  Future<AuthenticatedUser?> signInWithGoogle() async {
    try {
      await _authentication.signIn();
    } on Exception catch (exception, stack) {
      await _firebaseCrashlytics.recordError(exception, stack);
      emit(LoginLoadFailure());
    }
  }

  Future<void> signOut() async {
    try {
      await _authentication.signOut();
    } on Exception catch (exception, stack) {
      await _firebaseCrashlytics.recordError(exception, stack);
      emit(LoginLoadFailure());
    }
  }
}
