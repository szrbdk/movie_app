import 'dart:convert';

List<Aliase> aliaseFromJson(String str) =>
    List<Aliase>.from(json.decode(str).map((x) => Aliase.fromJson(x)));

String aliaseToJson(List<Aliase> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aliase {
  String title;
  String country;

  Aliase({
    this.title,
    this.country,
  });

  Aliase copyWith({
    String title,
    String country,
  }) =>
      Aliase(
        title: title ?? this.title,
        country: country ?? this.country,
      );

  factory Aliase.fromJson(Map<String, dynamic> json) => Aliase(
        title: json["title"] == null ? null : json["title"],
        country: json["country"] == null ? null : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "country": country == null ? null : country,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Aliase && o.title == title && o.country == country;
  }

  @override
  int get hashCode => title.hashCode ^ country.hashCode;

  @override
  String toString() => 'Aliase title: $title, country: $country';
}
