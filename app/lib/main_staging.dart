import 'package:flutter/material.dart';

import 'configs/app_config.dart';
import 'main.dart';

void main() {
  const AppConfig appConfig = AppConfig(
    appName: 'Ryco Stage',
    buildFlavor: Flavor.stage,
    child: RycoApp(),
  );

  return runApp(appConfig);
}
