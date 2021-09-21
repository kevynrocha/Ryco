import 'package:feature_home/feature_home.dart';
import 'package:feature_login/feature_login.dart';
import 'package:feature_splash/feature_splash.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const featureSplash = 'featureSplash';
  static const featureHome = 'featureHome';
  static const featureLogin = 'featureLogin';

  static CupertinoPageRoute routes(RouteSettings settings) {
    switch (settings.name) {
      case featureSplash:
        return CupertinoPageRoute(
          builder: (_) => const FeatureSplash(),
          settings: settings,
        );
      case featureHome:
        return CupertinoPageRoute(
          builder: (_) => const FeatureHome(),
          settings: settings,
        );
      case featureLogin:
        return CupertinoPageRoute(
          builder: (_) => const FeatureLogin(),
          settings: settings,
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => const FeatureSplash(),
          settings: settings,
        );
    }
  }
}
