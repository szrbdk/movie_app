import 'dart:convert';

import 'package:progress_follower/model/ids/ids.dart';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  String name;
  Ids ids;
  String biography;
  DateTime birthday;
  String death;
  String birthplace;
  String homepage;

  Person({
    this.name,
    this.ids,
    this.biography,
    this.birthday,
    this.death,
    this.birthplace,
    this.homepage,
  });

  Person copyWith({
    String name,
    Ids ids,
    String biography,
    DateTime birthday,
    String death,
    String birthplace,
    String homepage,
  }) =>
      Person(
        name: name ?? this.name,
        ids: ids ?? this.ids,
        biography: biography ?? this.biography,
        birthday: birthday ?? this.birthday,
        death: death ?? this.death,
        birthplace: birthplace ?? this.birthplace,
        homepage: homepage ?? this.homepage,
      );

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"] == null ? null : json["name"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        biography: json["biography"] == null ? null : json["biography"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        death: json["death"] == null ? null : json["death"],
        birthplace: json["birthplace"] == null ? null : json["birthplace"],
        homepage: json["homepage"] == null ? null : json["homepage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "ids": ids == null ? null : ids.toJson(),
        "biography": biography == null ? null : biography,
        "birthday": birthday == null
            ? null
            : "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "death": death == null ? null : death,
        "birthplace": birthplace == null ? null : birthplace,
        "homepage": homepage == null ? null : homepage,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Person &&
        o.name == name &&
        o.ids == ids &&
        o.biography == biography &&
        o.birthday == birthday &&
        o.death == death &&
        o.birthplace == birthplace &&
        o.homepage == homepage;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        ids.hashCode ^
        biography.hashCode ^
        birthday.hashCode ^
        death.hashCode ^
        birthplace.hashCode ^
        homepage.hashCode;
  }

  @override
  String toString() {
    return 'Person name: $name, ids: $ids, biography: $biography, birthday: $birthday, death: $death, birthplace: $birthplace, homepage: $homepage';
  }
}
