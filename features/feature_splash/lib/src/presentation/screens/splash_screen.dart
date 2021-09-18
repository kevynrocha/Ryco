import 'package:flutter/material.dart';
import 'package:core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Screen')),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: ElevatedButton(
            child: const Text('Navigate to Home'),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.featureHome),
          ),
        ),
      ),
    );
  }
}
