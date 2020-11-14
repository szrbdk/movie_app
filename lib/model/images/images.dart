import 'package:progress_follower/model/avatar/avatar.dart';

class Images {
  Avatar avatar;

  Images({
    this.avatar,
  });

  Images copyWith({
    Avatar avatar,
  }) =>
      Images(
        avatar: avatar ?? this.avatar,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Images && o.avatar == avatar;
  }

  @override
  int get hashCode => avatar.hashCode;

  @override
  String toString() => 'Images avatar: $avatar';
}
