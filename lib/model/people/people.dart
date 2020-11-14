import 'dart:convert';

import 'package:progress_follower/model/cast/cast.dart';
import 'package:progress_follower/model/crew/crew.dart';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

String peopleToJson(People data) => json.encode(data.toJson());

class People {
  List<Cast> cast;
  Crew crew;

  People({
    this.cast,
    this.crew,
  });

  People copyWith({
    List<Cast> cast,
    Crew crew,
  }) =>
      People(
        cast: cast ?? this.cast,
        crew: crew ?? this.crew,
      );

  factory People.fromJson(Map<String, dynamic> json) => People(
        cast: json["cast"] == null
            ? null
            : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null ? null : Crew.fromJson(json["crew"]),
      );

  Map<String, dynamic> toJson() => {
        "cast": cast == null
            ? null
            : List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": crew == null ? null : crew.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is People && o.cast == cast && o.crew == crew;
  }

  @override
  int get hashCode => cast.hashCode ^ crew.hashCode;

  @override
  String toString() => 'People cast: $cast, crew: $crew';
}
