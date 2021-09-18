import 'package:feature_home/feature_home.dart';
import 'package:feature_splash/feature_splash.dart';

class AppRoutes {
  static const featureSplash = 'featureSplash';
  static const featureHome = 'featureHome';

  static final routes = {
    featureSplash: (context) => const FeatureSplash(),
    featureHome: (context) => const FeatureHome(),
  };
}
