import 'dart:convert';

import 'certification.dart';

List<Certifications> certificationsFromJson(String str) =>
    List<Certifications>.from(
        json.decode(str).map((x) => Certifications.fromJson(x)));

String certificationsToJson(List<Certifications> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Certifications {
  List<Certification> us;

  Certifications({
    this.us,
  });

  Certifications copyWith({
    List<Certification> us,
  }) =>
      Certifications(
        us: us ?? this.us,
      );

  factory Certifications.fromJson(Map<String, dynamic> json) => Certifications(
        us: json["us"] == null
            ? null
            : List<Certification>.from(
                json["us"].map((x) => Certification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "us": us == null ? null : List<dynamic>.from(us.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Certifications && o.us == us;
  }

  @override
  int get hashCode => us.hashCode;

  @override
  String toString() => 'Certifications us: $us';
}
