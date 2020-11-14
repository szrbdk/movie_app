import 'dart:convert';

List<Certification> certificationFromJson(String str) =>
    List<Certification>.from(
        json.decode(str).map((x) => Certification.fromJson(x)));

String certificationToJson(List<Certification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Certification {
  String name;
  String slug;
  String description;

  Certification({
    this.name,
    this.slug,
    this.description,
  });

  Certification copyWith({
    String name,
    String slug,
    String description,
  }) =>
      Certification(
        name: name ?? this.name,
        slug: slug ?? this.slug,
        description: description ?? this.description,
      );

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Certification &&
        o.name == name &&
        o.slug == slug &&
        o.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ slug.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'Certification name: $name, slug: $slug, description: $description';
}
