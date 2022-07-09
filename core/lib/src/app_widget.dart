import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.featureSplash,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
