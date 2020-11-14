import 'dart:convert';

import 'package:progress_follower/model/ids/ids.dart';

List<Episode> episodeFromJson(String str) =>
    List<Episode>.from(json.decode(str).map((x) => Episode.fromJson(x)));

String episodeToJson(List<Episode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Episode {
  int season;
  int number;
  String title;
  Ids ids;
  int numberAbs;
  String overview;
  double rating;
  int votes;
  int commentCount;
  DateTime firstAired;
  DateTime updatedAt;
  List<String> availableTranslations;
  int runtime;

  Episode({
    this.season,
    this.number,
    this.title,
    this.ids,
    this.numberAbs,
    this.overview,
    this.rating,
    this.votes,
    this.commentCount,
    this.firstAired,
    this.updatedAt,
    this.availableTranslations,
    this.runtime,
  });

  Episode copyWith({
    int season,
    int number,
    String title,
    Ids ids,
    int numberAbs,
    String overview,
    double rating,
    int votes,
    int commentCount,
    DateTime firstAired,
    DateTime updatedAt,
    List<String> availableTranslations,
    int runtime,
  }) =>
      Episode(
        season: season ?? this.season,
        number: number ?? this.number,
        title: title ?? this.title,
        ids: ids ?? this.ids,
        numberAbs: numberAbs ?? this.numberAbs,
        overview: overview ?? this.overview,
        rating: rating ?? this.rating,
        votes: votes ?? this.votes,
        commentCount: commentCount ?? this.commentCount,
        firstAired: firstAired ?? this.firstAired,
        updatedAt: updatedAt ?? this.updatedAt,
        availableTranslations:
            availableTranslations ?? this.availableTranslations,
        runtime: runtime ?? this.runtime,
      );

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        season: json["season"] == null ? null : json["season"],
        number: json["number"] == null ? null : json["number"],
        title: json["title"] == null ? null : json["title"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        numberAbs: json["number_abs"] == null ? null : json["number_abs"],
        overview: json["overview"] == null ? null : json["overview"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        votes: json["votes"] == null ? null : json["votes"],
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        firstAired: json["first_aired"] == null
            ? null
            : DateTime.parse(json["first_aired"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        availableTranslations: json["available_translations"] == null
            ? null
            : List<String>.from(json["available_translations"].map((x) => x)),
        runtime: json["runtime"] == null ? null : json["runtime"],
      );

  Map<String, dynamic> toJson() => {
        "season": season == null ? null : season,
        "number": number == null ? null : number,
        "title": title == null ? null : title,
        "ids": ids == null ? null : ids.toJson(),
        "number_abs": numberAbs == null ? null : numberAbs,
        "overview": overview == null ? null : overview,
        "rating": rating == null ? null : rating,
        "votes": votes == null ? null : votes,
        "comment_count": commentCount == null ? null : commentCount,
        "first_aired": firstAired == null ? null : firstAired.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "available_translations": availableTranslations == null
            ? null
            : List<dynamic>.from(availableTranslations.map((x) => x)),
        "runtime": runtime == null ? null : runtime,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Episode &&
        o.season == season &&
        o.number == number &&
        o.title == title &&
        o.ids == ids &&
        o.numberAbs == numberAbs &&
        o.overview == overview &&
        o.rating == rating &&
        o.votes == votes &&
        o.commentCount == commentCount &&
        o.firstAired == firstAired &&
        o.updatedAt == updatedAt &&
        o.availableTranslations == availableTranslations &&
        o.runtime == runtime;
  }

  @override
  int get hashCode {
    return season.hashCode ^
        number.hashCode ^
        title.hashCode ^
        ids.hashCode ^
        numberAbs.hashCode ^
        overview.hashCode ^
        rating.hashCode ^
        votes.hashCode ^
        commentCount.hashCode ^
        firstAired.hashCode ^
        updatedAt.hashCode ^
        availableTranslations.hashCode ^
        runtime.hashCode;
  }

  @override
  String toString() {
    return 'Episode season: $season, number: $number, title: $title, ids: $ids, numberAbs: $numberAbs, overview: $overview, rating: $rating, votes: $votes, commentCount: $commentCount, firstAired: $firstAired, updatedAt: $updatedAt, availableTranslations: $availableTranslations, runtime: $runtime';
  }
}
