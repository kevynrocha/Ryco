import 'package:flutter/widgets.dart';

enum Flavor { development, stage, production }

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required Widget child,
    required this.appName,
    required this.buildFlavor,
  }) : super(key: key, child: child);

  final String appName;
  final Flavor buildFlavor;

  static AppConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
