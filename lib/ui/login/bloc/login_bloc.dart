import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/client/services/login_service.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/manager/session_manager.dart';
import 'package:progress_follower/model/auth/auth.dart';
import 'package:progress_follower/model/token/token.dart';
import 'package:progress_follower/ui/login/bloc/login_event.dart';
import 'package:progress_follower/ui/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  String toString() {
    return "LoginBloc";
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is BeginLoginEvent) {
      yield LoginInitializeState();
      try {
        Token token = await login(event.code);
        print(token);
        await SessionManager.saveToken(token);
        await SessionManager.myProfile();
        yield LoginSuccessState();
      } catch (error) {
        yield LoginErrorState(error);
      }
    }
  }

  Future<Token> login(String code) {
    Completer completer = Completer<Token>();
    Auth data = Auth(
      code: code,
      clientId: Env.traktApiKey,
      clientSecret: Env.traktSecret,
      redirectUri: ApiHelper.redirect,
      grantType: ApiHelper.grantWithAuthCode,
    );
    LoginService().access(data).then((res) {
      if (res != null) {
        completer.complete(res);
      } else {
        completer.completeError("Login Failed");
      }
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }
}
