import 'dart:convert';

import 'package:progress_follower/model/ids/ids.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';

List<Movie> movieFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  String title;
  int year;
  Ids ids;
  String tagline;
  String overview;
  DateTime released;
  int runtime;
  String country;
  String trailer;
  String homepage;
  String status;
  double rating;
  int votes;
  int commentCount;
  DateTime updatedAt;
  String language;
  List<String> availableTranslations;
  List<String> genres;
  String certification;
  DateTime watchedAt;

  TmdbImage image;

  Movie({
    this.watchedAt,
    this.title,
    this.year,
    this.ids,
    this.tagline,
    this.overview,
    this.released,
    this.runtime,
    this.country,
    this.trailer,
    this.homepage,
    this.status,
    this.rating,
    this.votes,
    this.commentCount,
    this.updatedAt,
    this.language,
    this.availableTranslations,
    this.genres,
    this.certification,
    this.image,
  });

  Movie copyWith({
    String title,
    int year,
    Ids ids,
    String tagline,
    String overview,
    DateTime released,
    int runtime,
    String country,
    String trailer,
    String homepage,
    String status,
    double rating,
    int votes,
    int commentCount,
    DateTime updatedAt,
    String language,
    List<String> availableTranslations,
    List<String> genres,
    String certification,
    DateTime watchedAt,
    TmdbImage image,
  }) =>
      Movie(
        title: title ?? this.title,
        year: year ?? this.year,
        ids: ids ?? this.ids,
        tagline: tagline ?? this.tagline,
        overview: overview ?? this.overview,
        released: released ?? this.released,
        runtime: runtime ?? this.runtime,
        country: country ?? this.country,
        trailer: trailer ?? this.trailer,
        homepage: homepage ?? this.homepage,
        status: status ?? this.status,
        rating: rating ?? this.rating,
        votes: votes ?? this.votes,
        commentCount: commentCount ?? this.commentCount,
        updatedAt: updatedAt ?? this.updatedAt,
        language: language ?? this.language,
        availableTranslations:
            availableTranslations ?? this.availableTranslations,
        genres: genres ?? this.genres,
        certification: certification ?? this.certification,
        watchedAt: watchedAt ?? this.watchedAt,
        image: image ?? this.image,
      );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        tagline: json["tagline"] == null ? null : json["tagline"],
        overview: json["overview"] == null ? null : json["overview"],
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        country: json["country"] == null ? null : json["country"],
        trailer: json["trailer"] == null ? null : json["trailer"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        status: json["status"] == null ? null : json["status"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        votes: json["votes"] == null ? null : json["votes"],
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        language: json["language"] == null ? null : json["language"],
        availableTranslations: json["available_translations"] == null
            ? null
            : List<String>.from(json["available_translations"].map((x) => x)),
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        certification:
            json["certification"] == null ? null : json["certification"],
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "ids": ids == null ? null : ids.toJson(),
        "tagline": tagline == null ? null : tagline,
        "overview": overview == null ? null : overview,
        "released": released == null
            ? null
            : "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "runtime": runtime == null ? null : runtime,
        "country": country == null ? null : country,
        "trailer": trailer == null ? null : trailer,
        "homepage": homepage == null ? null : homepage,
        "status": status == null ? null : status,
        "rating": rating == null ? null : rating,
        "votes": votes == null ? null : votes,
        "comment_count": commentCount == null ? null : commentCount,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "language": language == null ? null : language,
        "available_translations": availableTranslations == null
            ? null
            : List<dynamic>.from(availableTranslations.map((x) => x)),
        "genres":
            genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
        "certification": certification == null ? null : certification,
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Movie &&
        o.title == title &&
        o.year == year &&
        o.ids == ids &&
        o.tagline == tagline &&
        o.overview == overview &&
        o.released == released &&
        o.runtime == runtime &&
        o.country == country &&
        o.trailer == trailer &&
        o.homepage == homepage &&
        o.status == status &&
        o.rating == rating &&
        o.votes == votes &&
        o.commentCount == commentCount &&
        o.updatedAt == updatedAt &&
        o.language == language &&
        o.availableTranslations == availableTranslations &&
        o.genres == genres &&
        o.certification == certification &&
        o.watchedAt == watchedAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        year.hashCode ^
        ids.hashCode ^
        tagline.hashCode ^
        overview.hashCode ^
        released.hashCode ^
        runtime.hashCode ^
        country.hashCode ^
        trailer.hashCode ^
        homepage.hashCode ^
        status.hashCode ^
        rating.hashCode ^
        votes.hashCode ^
        commentCount.hashCode ^
        updatedAt.hashCode ^
        language.hashCode ^
        availableTranslations.hashCode ^
        genres.hashCode ^
        certification.hashCode ^
        watchedAt.hashCode;
  }

  @override
  String toString() {
    return 'Movie title: $title, year: $year, ids: $ids, tagline: $tagline, overview: $overview, released: $released, runtime: $runtime, country: $country, trailer: $trailer, homepage: $homepage, status: $status, rating: $rating, votes: $votes, commentCount: $commentCount, updatedAt: $updatedAt, language: $language, availableTranslations: $availableTranslations, genres: $genres, certification: $certification, watchedAt: $watchedAt';
  }

  String get poster => image?.posters?.first?.filePath;
  String get backdrop => image?.backdrops?.first?.filePath;

  List<ImageDetail> get posters => image?.posters;
  List<ImageDetail> get backdrops => image?.backdrops;

  set posters(List<ImageDetail> posterList) {
    if (image == null) {
      image = TmdbImage(posters: posterList);
    } else {
      image.posters = posterList;
    }
  }

  set backdrops(List<ImageDetail> backdropList) {
    if (image == null) {
      image = TmdbImage(backdrops: backdropList);
    } else {
      image.backdrops = backdropList;
    }
  }
}
