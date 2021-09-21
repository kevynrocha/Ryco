import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import 'presentation/cubit/splash_cubit.dart';
import 'presentation/screens/splash_screen.dart';

class FeatureSplash extends StatelessWidget {
  const FeatureSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: const SplashScreen(),
    );
  }
}
