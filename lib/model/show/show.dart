import 'dart:convert';

import 'package:progress_follower/model/airs/airs.dart';
import 'package:progress_follower/model/ids/ids.dart';
import 'package:progress_follower/model/season/season.dart';

List<Show> showFromJson(String str) =>
    List<Show>.from(json.decode(str).map((x) => Show.fromJson(x)));

String showToJson(List<Show> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Show {
  String title;
  int year;
  Ids ids;
  String overview;
  DateTime firstAired;
  Airs airs;
  int runtime;
  String certification;
  String network;
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
  int airedEpisodes;
  List<Season> seasons;

  Show({
    this.title,
    this.year,
    this.ids,
    this.overview,
    this.firstAired,
    this.airs,
    this.runtime,
    this.certification,
    this.network,
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
    this.airedEpisodes,
    this.seasons,
  });

  Show copyWith({
    String title,
    int year,
    Ids ids,
    String overview,
    DateTime firstAired,
    Airs airs,
    int runtime,
    String certification,
    String network,
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
    int airedEpisodes,
    List<Season> seasons,
  }) =>
      Show(
        title: title ?? this.title,
        year: year ?? this.year,
        ids: ids ?? this.ids,
        overview: overview ?? this.overview,
        firstAired: firstAired ?? this.firstAired,
        airs: airs ?? this.airs,
        runtime: runtime ?? this.runtime,
        certification: certification ?? this.certification,
        network: network ?? this.network,
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
        airedEpisodes: airedEpisodes ?? this.airedEpisodes,
        seasons: seasons ?? this.seasons,
      );

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        overview: json["overview"] == null ? null : json["overview"],
        firstAired: json["first_aired"] == null
            ? null
            : DateTime.parse(json["first_aired"]),
        airs: json["airs"] == null ? null : Airs.fromJson(json["airs"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        certification:
            json["certification"] == null ? null : json["certification"],
        network: json["network"] == null ? null : json["network"],
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
        airedEpisodes:
            json["aired_episodes"] == null ? null : json["aired_episodes"],
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "ids": ids == null ? null : ids.toJson(),
        "overview": overview == null ? null : overview,
        "first_aired": firstAired == null ? null : firstAired.toIso8601String(),
        "airs": airs == null ? null : airs.toJson(),
        "runtime": runtime == null ? null : runtime,
        "certification": certification == null ? null : certification,
        "network": network == null ? null : network,
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
        "aired_episodes": airedEpisodes == null ? null : airedEpisodes,
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Show &&
        o.title == title &&
        o.year == year &&
        o.ids == ids &&
        o.overview == overview &&
        o.firstAired == firstAired &&
        o.airs == airs &&
        o.runtime == runtime &&
        o.certification == certification &&
        o.network == network &&
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
        o.airedEpisodes == airedEpisodes &&
        o.seasons == seasons;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        year.hashCode ^
        ids.hashCode ^
        overview.hashCode ^
        firstAired.hashCode ^
        airs.hashCode ^
        runtime.hashCode ^
        certification.hashCode ^
        network.hashCode ^
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
        airedEpisodes.hashCode ^
        seasons.hashCode;
  }

  @override
  String toString() {
    return 'Show title: $title, year: $year, ids: $ids, overview: $overview, firstAired: $firstAired, airs: $airs, runtime: $runtime, certification: $certification, network: $network, country: $country, trailer: $trailer, homepage: $homepage, status: $status, rating: $rating, votes: $votes, commentCount: $commentCount, updatedAt: $updatedAt, language: $language, availableTranslations: $availableTranslations, genres: $genres, airedEpisodes: $airedEpisodes, seasons: $seasons';
  }
}
