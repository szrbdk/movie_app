import 'dart:convert';

List<Translation> translationFromJson(String str) => List<Translation>.from(
    json.decode(str).map((x) => Translation.fromJson(x)));

String translationToJson(List<Translation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Translation {
  String title;
  String overview;
  String tagline;
  String language;

  Translation({
    this.title,
    this.overview,
    this.tagline,
    this.language,
  });

  Translation copyWith({
    String title,
    String overview,
    String tagline,
    String language,
  }) =>
      Translation(
        title: title ?? this.title,
        overview: overview ?? this.overview,
        tagline: tagline ?? this.tagline,
        language: language ?? this.language,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        title: json["title"] == null ? null : json["title"],
        overview: json["overview"] == null ? null : json["overview"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        language: json["language"] == null ? null : json["language"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "overview": overview == null ? null : overview,
        "tagline": tagline == null ? null : tagline,
        "language": language == null ? null : language,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Translation &&
        o.title == title &&
        o.overview == overview &&
        o.tagline == tagline &&
        o.language == language;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        tagline.hashCode ^
        language.hashCode;
  }

  @override
  String toString() {
    return 'Translation title: $title, overview: $overview, tagline: $tagline, language: $language';
  }
}
