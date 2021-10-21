import 'package:common_dependencies/common_dependencies.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.firebaseApp,
    required this.remoteConfig,
    required this.firebaseAuth,
    required this.firebaseAnalytics,
    required this.firebaseCrashlytics,
  }) : super(SplashLoadInProgress());

  final FirebaseCrashlytics firebaseCrashlytics;
  final FirebaseAnalytics firebaseAnalytics;
  final RemoteConfig remoteConfig;
  final FirebaseAuth firebaseAuth;
  final FirebaseApp firebaseApp;

  static const String _firebaseName = '[DEFAULT]';

  Future<void> init() async {
    await Future.wait([
      _initializeFirebaseApp(),
      _initializeFirebaseAnalytics(),
      _fetchRemoteConfigs(),
    ]);

    emit(SplashLoadSuccess());
  }

  Future<void> _initializeFirebaseApp() async {
    try {
      if (firebaseApp.name != _firebaseName) {
        throw Exception('Initialized default app $firebaseApp');
      }
    } on Exception catch (exception, stack) {
      firebaseCrashlytics.recordError(exception, stack);
    }
  }

  Future<void> _initializeFirebaseAnalytics() async {
    try {
      await firebaseAnalytics.logAppOpen();
    } on Exception catch (exception, stack) {
      firebaseCrashlytics.recordError(exception, stack);
      emit(SplashLoadFailure());
    }
  }

  Future<void> _fetchRemoteConfigs() async {
    try {
      await remoteConfig.fetchAndActivate();
    } on Exception catch (exception, stack) {
      firebaseCrashlytics.recordError(exception, stack);
    }
  }
}
