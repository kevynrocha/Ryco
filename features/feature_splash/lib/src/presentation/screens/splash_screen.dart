import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E50),
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.featureLogin);
          }
        },
        builder: (context, state) {
          if (state is SplashLoadFailure) {
            return const Center(
              child: Text(
                'Erro',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon.png',
                  package: 'feature_splash',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
