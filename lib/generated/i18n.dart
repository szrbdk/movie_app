import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Login with Trakt.TV"
  String get trakt_login => "Login with Trakt.TV";
  /// "Contiune without login."
  String get login_without_auth => "Contiune without login.";
  /// "Login failed."
  String get login_failed => "Login failed.";
  /// "Please try again."
  String get try_again => "Please try again.";
  /// "OK"
  String get ok => "OK";
  /// "Login"
  String get login => "Login";
  /// "Code must be 8 character"
  String get code_lenght_warning => "Code must be 8 character";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_tr_TR extends I18n {
  const _I18n_tr_TR();

  /// "Trakt.TV ile bağlan."
  @override
  String get trakt_login => "Trakt.TV ile bağlan.";
  /// "Bağlanmadan devam et."
  @override
  String get login_without_auth => "Bağlanmadan devam et.";
  /// "Giriş başarısız."
  @override
  String get login_failed => "Giriş başarısız.";
  /// "Lütfen tekrar deneyin."
  @override
  String get try_again => "Lütfen tekrar deneyin.";
  /// "TAMAM"
  @override
  String get ok => "TAMAM";
  /// "Giriş yap"
  @override
  String get login => "Giriş yap";
  /// "Giriş kodu 8 karakter olmalıdır."
  @override
  String get code_lenght_warning => "Giriş kodu 8 karakter olmalıdır.";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("tr", "TR")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("tr_TR" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_tr_TR());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("tr" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_tr_TR());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}