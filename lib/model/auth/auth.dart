import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  String code;
  String clientId;
  String clientSecret;
  String redirectUri;
  String grantType;
  String token;
  String refreshToken;

  Auth({
    this.code,
    this.clientId,
    this.clientSecret,
    this.redirectUri,
    this.grantType,
    this.token,
    this.refreshToken,
  });

  Auth copyWith({
    String code,
    String clientId,
    String clientSecret,
    String redirectUri,
    String grantType,
    String token,
    String refreshToken,
  }) =>
      Auth(
        code: code ?? this.code,
        clientId: clientId ?? this.clientId,
        clientSecret: clientSecret ?? this.clientSecret,
        redirectUri: redirectUri ?? this.redirectUri,
        grantType: grantType ?? this.grantType,
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        code: json["code"] == null ? null : json["code"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        clientSecret:
            json["client_secret"] == null ? null : json["client_secret"],
        redirectUri: json["redirect_uri"] == null ? null : json["redirect_uri"],
        grantType: json["grant_type"] == null ? null : json["grant_type"],
        token: json["token"] == null ? null : json["token"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "client_id": clientId == null ? null : clientId,
        "client_secret": clientSecret == null ? null : clientSecret,
        "redirect_uri": redirectUri == null ? null : redirectUri,
        "grant_type": grantType == null ? null : grantType,
        "token": token == null ? null : token,
        "refresh_token": refreshToken == null ? null : refreshToken,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Auth &&
        o.code == code &&
        o.clientId == clientId &&
        o.clientSecret == clientSecret &&
        o.redirectUri == redirectUri &&
        o.grantType == grantType &&
        o.token == token &&
        o.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        clientId.hashCode ^
        clientSecret.hashCode ^
        redirectUri.hashCode ^
        grantType.hashCode ^
        token.hashCode ^
        refreshToken.hashCode;
  }

  @override
  String toString() {
    return 'Auth code: $code, clientId: $clientId, clientSecret: $clientSecret, redirectUri: $redirectUri, grantType: $grantType, token: $token, refreshToken: $refreshToken';
  }
}
