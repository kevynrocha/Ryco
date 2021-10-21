import 'package:authentication_service/authentication_service.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import 'presentation/cubit/login_cubit.dart';
import 'presentation/screens/login_code/login_code.dart';

class FeatureLogin extends StatelessWidget {
  const FeatureLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        firebaseCrashlytics: FirebaseCrashlytics.instance,
        authentication: AuthenticationImpl(
          firebaseCrashlytics: FirebaseCrashlytics.instance,
          firebaseAuth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
        ),
      ),
      child: const LoginCode(),
    );
  }
}
