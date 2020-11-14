import 'dart:convert';

List<Ids> idsFromJson(String str) =>
    List<Ids>.from(json.decode(str).map((x) => Ids.fromJson(x)));

String idsToJson(List<Ids> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ids {
  int trakt;
  int tvdb;
  String imdb;
  int tmdb;
  int tvrage;
  String slug;

  Ids({
    this.trakt,
    this.tvdb,
    this.imdb,
    this.tmdb,
    this.tvrage,
    this.slug,
  });

  Ids copyWith({
    int trakt,
    int tvdb,
    String imdb,
    int tmdb,
    int tvrage,
    String slug,
  }) =>
      Ids(
        trakt: trakt ?? this.trakt,
        tvdb: tvdb ?? this.tvdb,
        imdb: imdb ?? this.imdb,
        tmdb: tmdb ?? this.tmdb,
        tvrage: tvrage ?? this.tvrage,
        slug: slug ?? this.slug,
      );

  factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"] == null ? null : json["trakt"],
        tvdb: json["tvdb"] == null ? null : json["tvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
        tmdb: json["tmdb"] == null ? null : json["tmdb"],
        tvrage: json["tvrage"] == null ? null : json["tvrage"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "trakt": trakt == null ? null : trakt,
        "tvdb": tvdb == null ? null : tvdb,
        "imdb": imdb == null ? null : imdb,
        "tmdb": tmdb == null ? null : tmdb,
        "tvrage": tvrage == null ? null : tvrage,
        "slug": slug == null ? null : slug,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Ids &&
        o.trakt == trakt &&
        o.tvdb == tvdb &&
        o.imdb == imdb &&
        o.tmdb == tmdb &&
        o.tvrage == tvrage &&
        o.slug == slug;
  }

  @override
  int get hashCode {
    return trakt.hashCode ^
        tvdb.hashCode ^
        imdb.hashCode ^
        tmdb.hashCode ^
        tvrage.hashCode ^
        slug.hashCode;
  }

  @override
  String toString() {
    return 'Ids trakt: $trakt, tvdb: $tvdb, imdb: $imdb, tmdb: $tmdb, tvrage: $tvrage, slug: $slug';
  }
}
