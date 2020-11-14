import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/client/services/login_service.dart';
import 'package:progress_follower/manager/session_manager.dart';
import 'package:progress_follower/manager/temp_storage.dart';
import 'package:progress_follower/model/auth/auth.dart';
import 'package:progress_follower/model/countries/countries.dart';
import 'package:progress_follower/model/language/language.dart';
import 'package:progress_follower/model/token/token.dart';
import 'package:progress_follower/ui/auth/bloc/auth_event.dart';
import 'package:progress_follower/ui/auth/bloc/auth_state.dart';
import 'package:progress_follower/utils/enums.dart';
import 'package:progress_follower/utils/helpers/helper.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState());

  @override
  String toString() {
    return "AuthBloc";
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is InitAuthEvent) {
      yield AuthInitializingState();
      List<Future> futures = [];
      Token token;
      List<Country> countries;
      List<Language> languages;
      await Future.wait([
        SessionManager.getSavedToken().then((value) => token = value),
        SessionManager.getSavedCountries().then((value) => countries = value),
        SessionManager.getSavedLanguages().then((value) => languages = value),
      ]);
      if (token == null) {
        TempStorage().setAuthStatus(AuthStatus.unauthenticated);
        yield UnAuthenticatedState();
      } else {
        if (Helper.isTokenRequiresRefresh(token)) {
          futures.add(SessionManager.refreshToken(token).then((value) {
            token = value;
            TempStorage().setToken(token);
          }));
        } else {
          TempStorage().setToken(token);
        }
        if (countries == null || countries.isEmpty) {
          futures.add(SessionManager.countries()
              .then((value) => TempStorage().setCountries(value)));
        }
        if (languages == null || languages.isEmpty) {
          futures.add(SessionManager.languages()
              .then((value) => TempStorage().setLanguages(value)));
        }
        await Future.wait(futures);
        print("Access Token: ${token.accessToken}");
        await SessionManager.myProfile();
        TempStorage().setAuthStatus(AuthStatus.authenticated);
        yield AuthenticatedState();
      }
    }
    if (event is LogoutEvent) {
      await logout();
      yield UnAuthenticatedState();
    }
  }

  Future<bool> logout() {
    Completer completer = Completer<bool>();
    Auth data = Auth(
      token: TempStorage().token.accessToken,
      clientId: Env.traktApiKey,
      clientSecret: Env.traktSecret,
    );
    LoginService().revoke(data).then((res) {
      if (res) {
        SessionManager.clearPrefs().then((_) => completer.complete(true));
      }
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }
}
