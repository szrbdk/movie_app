import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/model/auth/auth.dart';
import 'package:progress_follower/model/token/token.dart';

class LoginService {
  code() async {
    await RestClient().launchURL("${ApiHelper.codeUrl}");
  }

  /// [Auth(code: code, clientId: Env().traktClient,clientSecret: Env().traktSecret,redirectUri: Env().redirect,grantType: Env().grantType);]
  Future<Token> access(Auth data) {
    String path = "oauth/token";
    return RestClient().postRequest<Token, Map<String, dynamic>>(
      path: path,
      traktRequired: false,
      authRequired: false,
      parameters: null,
      data: data.toJson(),
      constructor: (data) => Token.fromJson(data),
    );
  }

  /// [Auth(refresh_token: Env().refreshToken, clientId: Env().traktClient,clientSecret: Env().traktSecret,redirectUri: Env().redirect,grantType: Env(true).grantType);]
  Future<Token> refresh(Auth data) {
    String path = "oauth/token";
    return RestClient().postRequest<Token, Map<String, dynamic>>(
      path: path,
      traktRequired: false,
      authRequired: false,
      parameters: null,
      data: data.toJson(),
      constructor: (data) => Token.fromJson(data),
    );
  }

  /// [Auth(token:Env().accessToken, clientId: Env().traktClient,clientSecret: Env().traktSecret)]
  Future<bool> revoke(Auth data) {
    String path = "oauth/revoke";
    return RestClient().postRequest<Map<String, dynamic>, bool>(
      path: path,
      traktRequired: false,
      authRequired: false,
      parameters: null,
      data: data.toJson(),
      constructor: (data) => true,
    );
  }
}
