import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class InitAuthEvent extends AuthEvent {
  @override
  List<Object> get props => null;
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => null;
}
