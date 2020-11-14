import 'package:progress_follower/model/ids/ids.dart';
import 'package:progress_follower/model/images/images.dart';

class User {
  String username;
  bool private;
  String name;
  bool vip;
  bool vipEp;
  Ids ids;
  DateTime joinedAt;
  String location;
  String about;
  String gender;
  int age;
  Images images;
  bool vipOg;
  int vipYears;

  User({
    this.username,
    this.private,
    this.name,
    this.vip,
    this.vipEp,
    this.ids,
    this.joinedAt,
    this.location,
    this.about,
    this.gender,
    this.age,
    this.images,
    this.vipOg,
    this.vipYears,
  });

  User copyWith({
    String username,
    bool private,
    String name,
    bool vip,
    bool vipEp,
    Ids ids,
    DateTime joinedAt,
    String location,
    String about,
    String gender,
    int age,
    Images images,
    bool vipOg,
    int vipYears,
  }) =>
      User(
        username: username ?? this.username,
        private: private ?? this.private,
        name: name ?? this.name,
        vip: vip ?? this.vip,
        vipEp: vipEp ?? this.vipEp,
        ids: ids ?? this.ids,
        joinedAt: joinedAt ?? this.joinedAt,
        location: location ?? this.location,
        about: about ?? this.about,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        images: images ?? this.images,
        vipOg: vipOg ?? this.vipOg,
        vipYears: vipYears ?? this.vipYears,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"] == null ? null : json["username"],
        private: json["private"] == null ? null : json["private"],
        name: json["name"] == null ? null : json["name"],
        vip: json["vip"] == null ? null : json["vip"],
        vipEp: json["vip_ep"] == null ? null : json["vip_ep"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        joinedAt: json["joined_at"] == null
            ? null
            : DateTime.parse(json["joined_at"]),
        location: json["location"] == null ? null : json["location"],
        about: json["about"] == null ? null : json["about"],
        gender: json["gender"] == null ? null : json["gender"],
        age: json["age"] == null ? null : json["age"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        vipOg: json["vip_og"] == null ? null : json["vip_og"],
        vipYears: json["vip_years"] == null ? null : json["vip_years"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "private": private == null ? null : private,
        "name": name == null ? null : name,
        "vip": vip == null ? null : vip,
        "vip_ep": vipEp == null ? null : vipEp,
        "ids": ids == null ? null : ids.toJson(),
        "joined_at": joinedAt == null ? null : joinedAt.toIso8601String(),
        "location": location == null ? null : location,
        "about": about == null ? null : about,
        "gender": gender == null ? null : gender,
        "age": age == null ? null : age,
        "images": images == null ? null : images.toJson(),
        "vip_og": vipOg == null ? null : vipOg,
        "vip_years": vipYears == null ? null : vipYears,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.username == username &&
        o.private == private &&
        o.name == name &&
        o.vip == vip &&
        o.vipEp == vipEp &&
        o.ids == ids &&
        o.joinedAt == joinedAt &&
        o.location == location &&
        o.about == about &&
        o.gender == gender &&
        o.age == age &&
        o.images == images &&
        o.vipOg == vipOg &&
        o.vipYears == vipYears;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        private.hashCode ^
        name.hashCode ^
        vip.hashCode ^
        vipEp.hashCode ^
        ids.hashCode ^
        joinedAt.hashCode ^
        location.hashCode ^
        about.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        images.hashCode ^
        vipOg.hashCode ^
        vipYears.hashCode;
  }

  @override
  String toString() {
    return 'User username: $username, private: $private, name: $name, vip: $vip, vipEp: $vipEp, ids: $ids, joinedAt: $joinedAt, location: $location, about: $about, gender: $gender, age: $age, images: $images, vipOg: $vipOg, vipYears: $vipYears';
  }
}
