import 'app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  static const _appName = 'Ryco';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.featureSplash,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
