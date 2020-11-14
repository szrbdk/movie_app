import 'package:progress_follower/model/countries/countries.dart';
import 'package:progress_follower/model/language/language.dart';
import 'package:progress_follower/model/token/token.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/utils/enums.dart';

class TempStorage {
  static UserSettings _me;
  static Token _token;
  static AuthStatus _authStatus;
  static List<Country> _countries;
  static List<Language> _languages;

  UserSettings get me => _me;
  Token get token => _token;
  AuthStatus get authStatus => _authStatus;
  List<Country> get countries => _countries;
  List<Language> get languages => _languages;

  // Custom getters
  String get accessToken => _token?.accessToken;
  String get refreshToken => _token?.refreshToken;

  setMe(UserSettings newMe) {
    _me = newMe;
  }

  setToken(Token newToken) {
    _token = newToken;
  }

  setAuthStatus(AuthStatus newAuthStatus) {
    _authStatus = newAuthStatus;
  }

  setCountries(List<Country> countries) {
    _countries = countries;
  }

  setLanguages(List<Language> languages) {
    _languages = languages;
  }
}
