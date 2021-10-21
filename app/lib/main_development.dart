import 'package:flutter/material.dart';

import 'configs/app_config.dart';
import 'main.dart';

void main() {
  const AppConfig appConfig = AppConfig(
    appName: 'Ryco Development',
    buildFlavor: Flavor.development,
    child: RycoApp(),
  );

  return runApp(appConfig);
}
