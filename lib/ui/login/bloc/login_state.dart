import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginInitializeState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginErrorState extends LoginState {
  final dynamic error;
  LoginErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "Login Error: $error";
  }
}
