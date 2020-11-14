import 'dart:convert';

List<Language> languageFromJson(String str) =>
    List<Language>.from(json.decode(str).map((x) => Language.fromJson(x)));

String languageToJson(List<Language> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Language {
  String name;
  String code;

  Language({
    this.name,
    this.code,
  });

  Language copyWith({
    String name,
    String code,
  }) =>
      Language(
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory Language.fromJson(Map<String, dynamic> json) => Language(
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

    return o is Language && o.name == name && o.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() => 'Language name: $name, code: $code';
}
