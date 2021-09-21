import 'package:common_dependencies/common_dependencies.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginLoadInProgress extends LoginState {}

class LoginLoadSuccess extends LoginState {}

class LoginLoadFailure extends LoginState {}
