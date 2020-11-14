import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/utils/helpers/helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

class RestClient {
  String _traktPath(String path) => "${ApiHelper.traktApiUrl}/$path";
  String _tmdbPath(String path) => "${ApiHelper.tmdbApiUrl}/$path";

  Options _options(bool traktRequired, bool authRequired) {
    Map<String, dynamic> headers = {};
    headers.putIfAbsent("content-type", () => "application/json");
    if (traktRequired) {
      headers.putIfAbsent("trakt-api-version", () => 2);
      headers.putIfAbsent("trakt-api-key", () => Env.traktApiKey);
    }
    if (authRequired) {
      headers.putIfAbsent("Authorization", () => ApiHelper.traktAuth);
    }
    return Options(headers: headers);
  }

  /// [K] --> Response'un Obje Tipi EXP => [Map] - [List<Map>]
  ///
  /// [T] --> Response'un dönüşeceği modelin Obje tipi EXP => [Movie] - [List<Movie>]
  Future getRequest<T, K>({
    @required String path,
    @required bool traktRequired,
    @required bool authRequired,
    @required Map<String, dynamic> parameters,
    @required Function(K) constructor,
  }) {
    Completer completer = Completer<T>();
    Dio dio = Dio();
    Options dioOptions = _options(traktRequired, authRequired);
    String url = _traktPath(path);
    print("Get Request URL: $url");
    print("Parameters: $parameters");
    dio
        .get(url, queryParameters: parameters, options: dioOptions)
        .then((response) {
      print(
          "RESPONSE -> Path: $path | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}");
      completer.complete(constructor(response.data));
    }).catchError((error, stacktrace) {
      print("Error on this path: $url");
      print("Parameters: $parameters");
      if (error.runtimeType == DioError) {
        DioError e = error as DioError;
        print("Dio Error: $e");
        completer.completeError(e);
      } else {
        print("Unknown error!");
        print(error);
        print(stacktrace);
        completer.completeError(error);
      }
    });
    return completer.future;
  }

  /// [K] --> Response'un Obje Tipi EXP => [Map] - [List<Map>]
  ///
  /// [T] --> Response'un dönüşeceği modelin Obje tipi EXP => [Token] - [List<Movie>]
  Future postRequest<T, K>({
    @required String path,
    @required bool traktRequired,
    @required bool authRequired,
    @required Map<String, dynamic> parameters,
    @required Map<String, dynamic> data,
    @required Function(K) constructor,
  }) {
    Completer completer = Completer<T>();
    Dio dio = Dio();
    Options dioOptions = _options(traktRequired, authRequired);
    String url = _traktPath(path);
    print("Post Request URL: $url");
    print("Parameters: $parameters");
    print("Request Data ${Helper.cleanData(data)}");
    dio
        .post(url,
            queryParameters: parameters,
            data: Helper.cleanData(data),
            options: dioOptions)
        .then((response) {
      print(
          "RESPONSE -> $path | ${response.statusCode} | ${response.statusMessage}");
      completer.complete(constructor(response.data));
    }).catchError((error, stacktrace) {
      print("P: Error on this path: $url");
      print("Parameters: $parameters");
      if (error is DioError) {
        print("Dio Error: $error");
        completer.completeError(error);
      } else {
        print("Unknown error!");
        print(error);
        print(stacktrace);
        completer.completeError(error);
      }
    });
    return completer.future;
  }

  Future deleteRequest(String path, bool traktRequired, bool authRequired) {
    Completer completer = Completer<bool>();
    Dio dio = Dio();
    Options dioOptions = _options(traktRequired, authRequired);
    String url = _traktPath(path);
    dio.post(url, options: dioOptions).then((response) {
      print(
          "RESPONSE -> Path: $path | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}");
      completer.complete(true);
    }).catchError((error, stacktrace) {
      print("Error on this path: $url");
      if (error is DioError) {
        print("Dio Error: $error");
        completer.completeError(error);
      } else {
        print("Unknown error!");
        print(error);
        print(stacktrace);
        completer.completeError(error);
      }
    });
    return completer.future;
  }

  /// [K] --> Response'un Obje Tipi EXP => [Map] - [List<Map>]
  ///
  /// [T] --> Response'un dönüşeceği modelin Obje tipi EXP => [Movie] - [List<Movie>]
  Future tmdbGetRequest<T, K>({ 
    @required String path,
    @required String language,
    @required Map<String, dynamic> parameters,
    @required Function(K) constructor,
  }) {
    Completer completer = Completer<T>();
    Dio dio = Dio();
    String url = _tmdbPath(path);
    if (parameters == null) {
      parameters = Map();
    }
    parameters.putIfAbsent("api_key", () => "${Env.tmdbApiKey}");
    if (language != null) {
      parameters.putIfAbsent("include_image_language", () => language);
      parameters.putIfAbsent("language", () => language);
    }
    dio.get(url, queryParameters: parameters).then((response) {
      print(
          "RESPONSE -> Path: $path | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}");
      completer.complete(constructor(response.data));
    }).catchError((error, stacktrace) {
      print("Error on this path: $url");
      print("Parameters: $parameters");
      if (error.runtimeType == DioError) {
        DioError e = error as DioError;
        print("Dio Error: $e");
        completer.completeError(e);
      } else {
        print("Unknown error!");
        print(error);
        print(stacktrace);
        completer.completeError(error);
      }
    });
    return completer.future;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
