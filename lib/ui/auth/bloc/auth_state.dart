import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => null;
}

class AuthInitializingState extends AuthState {
  @override
  List<Object> get props => null;
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}

class AuthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}

class AuthErrorState extends AuthState {
  final dynamic error;

  AuthErrorState(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "ERROR: $error";
  }
}
