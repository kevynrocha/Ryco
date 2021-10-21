import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';

class LoginSocialScreen extends StatelessWidget {
  const LoginSocialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async =>
                  await context.read<LoginCubit>().signInWithGoogle(),
              child: const Text('Sign in with Google'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF5200),
                minimumSize: const Size(double.maxFinite, 40),
                shape: const StadiumBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login with Facebook'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF5200),
                minimumSize: const Size(double.maxFinite, 40),
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
