import 'package:common_dependencies/common_dependencies.dart';

class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashLoadInProgress extends SplashState {}

class SplashLoadSuccess extends SplashState {}

class SplashLoadFailure extends SplashState {}
