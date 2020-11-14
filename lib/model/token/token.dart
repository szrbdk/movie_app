import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String scope;
  int createdAt;

  Token({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.createdAt,
  });

  Token copyWith({
    String accessToken,
    String tokenType,
    int expiresIn,
    String refreshToken,
    String scope,
    int createdAt,
  }) =>
      Token(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
        scope: json["scope"] == null ? null : json["scope"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "refresh_token": refreshToken == null ? null : refreshToken,
        "scope": scope == null ? null : scope,
        "created_at": createdAt == null ? null : createdAt,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Token &&
        o.accessToken == accessToken &&
        o.tokenType == tokenType &&
        o.expiresIn == expiresIn &&
        o.refreshToken == refreshToken &&
        o.scope == scope &&
        o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        tokenType.hashCode ^
        expiresIn.hashCode ^
        refreshToken.hashCode ^
        scope.hashCode ^
        createdAt.hashCode;
  }

  @override
  String toString() {
    return 'Token accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, createdAt: $createdAt';
  }
}
