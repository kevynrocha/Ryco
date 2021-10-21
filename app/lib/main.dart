import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'configs/app_config.dart';

class RycoApp extends StatelessWidget {
  const RycoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWidget(appName: AppConfig.of(context)!.appName);
  }
}
