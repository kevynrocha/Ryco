import 'package:common_dependencies/common_dependencies.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginState initialState) : super(LoginLoadInProgress());
}
