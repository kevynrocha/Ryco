import 'package:flutter/material.dart';
import 'main.dart';

import 'configs/app_config.dart';

void main() {
  const AppConfig appConfig = AppConfig(
    appName: 'Ryco Production',
    buildFlavor: Flavor.production,
    child: RycoApp(),
  );

  return runApp(appConfig);
}
