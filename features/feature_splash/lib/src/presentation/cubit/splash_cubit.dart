import 'package:common_dependencies/common_dependencies.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoadInProgress());

  static const String firebaseName = '[DEFAULT]';

  Future<void> init() async {
    await _initializeFirebaseApp();
    await _initializeFirebaseAnalytics();
  }

  Future<void> _initializeFirebaseApp() async {
    try {
      final FirebaseApp firebaseApp = await Firebase.initializeApp();

      if (firebaseApp.name != firebaseName) {
        throw Exception('Initialized default app $firebaseApp');
      }

      emit(SplashLoadSuccess());
    } on Exception catch (_) {
      emit(SplashLoadFailure());
    }
  }

  Future<void> _initializeFirebaseAnalytics() async {
    try {
      final FirebaseAnalytics analytics = FirebaseAnalytics();
      await analytics.logAppOpen();
      await analytics.logEvent(
        name: 'splash_screen',
        parameters: {'log': 'terceiro'},
      );
    } on Exception catch (_) {
      emit(SplashLoadFailure());
    }
  }
}
