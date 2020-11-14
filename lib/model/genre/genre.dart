import 'dart:convert';

List<Genre> genreFromJson(String str) =>
    List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

String genreToJson(List<Genre> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Genre {
  String name;
  String slug;

  Genre({
    this.name,
    this.slug,
  });

  Genre copyWith({
    String name,
    String slug,
  }) =>
      Genre(
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Genre && o.name == name && o.slug == slug;
  }

  @override
  int get hashCode => name.hashCode ^ slug.hashCode;

  @override
  String toString() => 'Genre name: $name, slug: $slug';
}
