import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

import 'presentation/cubit/splash_cubit.dart';
import 'presentation/screens/splash_screen.dart';

class FeatureSplash extends StatelessWidget {
  const FeatureSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (context, firebase) {
        if (firebase.hasData) {
          return BlocProvider(
            create: (_) => SplashCubit(
              firebaseApp: firebase.data!,
              firebaseAuth: FirebaseAuth.instance,
              remoteConfig: RemoteConfig.instance,
              firebaseAnalytics: FirebaseAnalytics(),
              firebaseCrashlytics: FirebaseCrashlytics.instance,
            )..init(),
            child: const SplashScreen(),
          );
        }

        return Container();
      },
    );
  }
}
