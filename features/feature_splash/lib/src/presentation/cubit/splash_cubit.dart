import 'package:common_dependencies/common_dependencies.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoadInProgress());

  Future<void> init() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashLoadSuccess());
    } on Exception catch (_) {
      emit(SplashLoadFailure());
    }
  }
}
