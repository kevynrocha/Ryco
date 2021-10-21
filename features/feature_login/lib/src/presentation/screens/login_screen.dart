import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'login_social_screen.dart';
import 'login_success_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoadSuccess) {
          return const LoginSuccessScreen();
        }

        return const LoginSocialScreen();
      },
    );
  }
}
