import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class BeginLoginEvent extends LoginEvent {
  final String code;

  BeginLoginEvent(this.code);

  @override
  List<Object> get props => [code];
}
