import 'dart:async';
import 'dart:convert';

import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/client/services/country_service.dart';
import 'package:progress_follower/client/services/language_service.dart';
import 'package:progress_follower/client/services/login_service.dart';
import 'package:progress_follower/client/services/user_service.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/manager/temp_storage.dart';
import 'package:progress_follower/model/auth/auth.dart';
import 'package:progress_follower/model/countries/countries.dart';
import 'package:progress_follower/model/language/language.dart';
import 'package:progress_follower/model/token/token.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/ui/auth/bloc/auth_event.dart';
import 'package:progress_follower/ui/auth/screen/auth_screen.dart';
import 'package:progress_follower/utils/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<bool> saveToken(Token token) {
    Completer completer = Completer<bool>();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(PrefVariables.token, json.encode(token)).then((_) {
        TempStorage().setToken(token);
        completer.complete(true);
      }).catchError((_) => completer.completeError(_));
    }).catchError((_) => completer.completeError(_));
    return completer.future;
  }

  static Future<Token> getSavedToken() {
    Completer completer = Completer<Token>();
    SharedPreferences.getInstance().then((prefs) {
      String tokenString = prefs.getString(PrefVariables.token);
      Token token;
      if (tokenString != null) {
        token = Token.fromJson(json.decode(tokenString));
        TempStorage().setToken(token);
      }
      completer.complete(token);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<bool> saveCountries(List<Country> countries) {
    Completer completer = Completer<bool>();
    SharedPreferences.getInstance().then((prefs) {
      prefs
          .setString(PrefVariables.countries, countriesToJson(countries))
          .then((_) {
        TempStorage().setCountries(countries);
        completer.complete(true);
      }).catchError((_) => completer.completeError(_));
    }).catchError((_) => completer.completeError(_));
    return completer.future;
  }

  static Future<List<Country>> getSavedCountries() {
    Completer completer = Completer<List<Country>>();
    SharedPreferences.getInstance().then((prefs) {
      String countriesString = prefs.getString(PrefVariables.countries);
      List<Country> countries;
      if (countriesString != null) {
        countries = countriesFromJson(countriesString);
        TempStorage().setCountries(countries);
      }
      completer.complete(countries);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<bool> saveLanguages(List<Language> languages) {
    Completer completer = Completer<bool>();
    SharedPreferences.getInstance().then((prefs) {
      prefs
          .setString(PrefVariables.languages, languageToJson(languages))
          .then((_) {
        TempStorage().setLanguages(languages);
        completer.complete(true);
      }).catchError((_) => completer.completeError(_));
    }).catchError((_) => completer.completeError(_));
    return completer.future;
  }

  static Future<List<Language>> getSavedLanguages() {
    Completer completer = Completer<List<Language>>();
    SharedPreferences.getInstance().then((prefs) {
      String languageString = prefs.getString(PrefVariables.languages);
      List<Language> languages;
      if (languageString != null) {
        languages = languageFromJson(languageString);
        TempStorage().setLanguages(languages);
      }
      completer.complete(languages);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<Token> refreshToken(Token token) {
    Completer completer = Completer<Token>();
    Auth data = Auth(
      refreshToken: token.refreshToken,
      clientId: Env.traktApiKey,
      clientSecret: Env.traktSecret,
      redirectUri: ApiHelper.redirect,
      grantType: ApiHelper.grantWithRefreshToken,
    );
    LoginService().refresh(data).then((response) {
      if (response != null) {
        SessionManager.saveToken(response).then((_) {
          completer.complete(response);
        });
      } else {
        completer.completeError("Token Refresh Failed");
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<bool> saveMyProfile(UserSettings settings) {
    Completer completer = Completer<bool>();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(PrefVariables.myProfile, json.encode(settings)).then((_) {
        TempStorage().setMe(settings);
        completer.complete(true);
      }).catchError((_) => completer.completeError(_));
    }).catchError((_) => completer.completeError(_));
    return completer.future;
  }

  static Future<UserSettings> getSavedMyProfile() {
    Completer completer = Completer<UserSettings>();
    SharedPreferences.getInstance().then((prefs) {
      String profileString = prefs.getString(PrefVariables.myProfile);
      UserSettings profile;
      print("PS> $profileString");
      if (profileString != null) {
        profile = UserSettings.fromJson(json.decode(profileString));
        TempStorage().setMe(profile);
      }
      completer.complete(profile);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<bool> clearPrefs() {
    Completer completer = Completer<bool>();
    SharedPreferences.getInstance().then((prefs) {
      prefs.clear().then((_) => completer.complete(true));
    }).catchError((_) => completer.completeError(_));
    return completer.future;
  }

  static Future<UserSettings> myProfile() {
    print("Try to get my profile!");
    Completer completer = Completer<UserSettings>();
    UserService()
        .settings({ParameterKeys.extended: ParameterValues.full}).then((res) {
      if (res != null) {
        saveMyProfile(res);
        completer.complete(res);
      } else {
        completer.completeError("Failed to get user profile");
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  static Future<List<Country>> countries() {
    Completer completer = Completer<List<Country>>();
    List<Country> movieCountries, showCountries;
    Future.wait([
      _countries(Types.movies).then((value) => movieCountries = value),
      _countries(Types.shows).then((value) => showCountries = value),
    ]).then((value) {
      showCountries.forEach((country) {
        int index = movieCountries
            .indexWhere((element) => element.code == country.code);
        if (index == -1) {
          movieCountries.add(country);
        }
      });
      completer.complete(movieCountries);
    }).catchError((error) => completer.complete([]));
    return completer.future;
  }

  static Future<List<Country>> _countries(String type) {
    Completer completer = Completer<List<Country>>();
    CountryService()
        .countries(type)
        .then((value) => completer.complete(value))
        .catchError((error) => completer.complete([]));
    return completer.future;
  }

  static Future<List<Language>> languages() {
    Completer completer = Completer<List<Language>>();
    List<Language> movieLanguages, showLanguages;
    Future.wait([
      _languages(Types.movies).then((value) => movieLanguages = value),
      _languages(Types.shows).then((value) => showLanguages = value),
    ]).then((value) {
      showLanguages.forEach((country) {
        int index = movieLanguages
            .indexWhere((element) => element.code == country.code);
        if (index == -1) {
          movieLanguages.add(country);
        }
      });
      completer.complete(movieLanguages);
    }).catchError((error) => completer.complete([]));
    return completer.future;
  }

  static Future<List<Language>> _languages(String type) {
    Completer completer = Completer<List<Language>>();
    LanguageService()
        .languages(type)
        .then((value) => completer.complete(value))
        .catchError((error) => completer.complete([]));
    return completer.future;
  }

  static logout() {
    authBloc.add(LogoutEvent());
  }
}
