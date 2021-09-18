import 'package:core/src/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rico',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.featureSplash,
      routes: AppRoutes.routes,
    );
  }
}
