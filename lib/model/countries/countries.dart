import 'dart:convert';

List<Country> countriesFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countriesToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  String name;
  String code;

  Country({
    this.name,
    this.code,
  });

  Country copyWith({
    String name,
    String code,
  }) =>
      Country(
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "code": code == null ? null : code,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country && o.name == name && o.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() => 'Countries name: $name, code: $code';
}
