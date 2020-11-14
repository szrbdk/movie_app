import 'dart:convert';

import 'package:progress_follower/model/account/account.dart';
import 'package:progress_follower/model/connections/connections.dart';
import 'package:progress_follower/model/sharing_text/sharing_text.dart';
import 'package:progress_follower/model/user/user.dart';

UserSettings userSettingsFromJson(String str) =>
    UserSettings.fromJson(json.decode(str));

String userSettingsToJson(UserSettings data) => json.encode(data.toJson());

class UserSettings {
  User user;
  Account account;
  Connections connections;
  SharingText sharingText;

  UserSettings({
    this.user,
    this.account,
    this.connections,
    this.sharingText,
  });

  UserSettings copyWith({
    User user,
    Account account,
    Connections connections,
    SharingText sharingText,
  }) =>
      UserSettings(
        user: user ?? this.user,
        account: account ?? this.account,
        connections: connections ?? this.connections,
        sharingText: sharingText ?? this.sharingText,
      );

  factory UserSettings.fromJson(Map<String, dynamic> json) => UserSettings(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        connections: json["connections"] == null
            ? null
            : Connections.fromJson(json["connections"]),
        sharingText: json["sharing_text"] == null
            ? null
            : SharingText.fromJson(json["sharing_text"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "account": account == null ? null : account.toJson(),
        "connections": connections == null ? null : connections.toJson(),
        "sharing_text": sharingText == null ? null : sharingText.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserSettings &&
        o.user == user &&
        o.account == account &&
        o.connections == connections &&
        o.sharingText == sharingText;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        account.hashCode ^
        connections.hashCode ^
        sharingText.hashCode;
  }

  @override
  String toString() {
    return 'UserSettings user: $user, account: $account, connections: $connections, sharingText: $sharingText';
  }
}
