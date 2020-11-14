import 'dart:convert';
import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/season/season.dart';
import 'package:progress_follower/model/show/show.dart';

HistoryResult historyResultFromJson(String str) =>
    HistoryResult.fromJson(json.decode(str));

String historyResultToJson(HistoryResult data) => json.encode(data.toJson());

class HistoryResult {
  ResultAction added;
  ResultAction deleted;
  ResultAction existing;
  NotFound notFound;

  HistoryResult({
    this.added,
    this.deleted,
    this.existing,
    this.notFound,
  });

  HistoryResult copyWith({
    ResultAction added,
    ResultAction deleted,
    ResultAction existing,
    NotFound notFound,
  }) =>
      HistoryResult(
        added: added ?? this.added,
        deleted: deleted ?? this.deleted,
        existing: existing ?? this.existing,
        notFound: notFound ?? this.notFound,
      );

  factory HistoryResult.fromJson(Map<String, dynamic> json) => HistoryResult(
        added:
            json["added"] == null ? null : ResultAction.fromJson(json["added"]),
        deleted: json["deleted"] == null
            ? null
            : ResultAction.fromJson(json["deleted"]),
        existing: json["existing"] == null
            ? null
            : ResultAction.fromJson(json["existing"]),
        notFound: json["not_found"] == null
            ? null
            : NotFound.fromJson(json["not_found"]),
      );

  Map<String, dynamic> toJson() => {
        "added": added == null ? null : added.toJson(),
        "deleted": deleted == null ? null : deleted.toJson(),
        "existing": existing == null ? null : existing.toJson(),
        "not_found": notFound == null ? null : notFound.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HistoryResult &&
        o.added == added &&
        o.deleted == deleted &&
        o.existing == existing &&
        o.notFound == notFound;
  }

  @override
  int get hashCode {
    return added.hashCode ^
        deleted.hashCode ^
        existing.hashCode ^
        notFound.hashCode;
  }

  @override
  String toString() {
    return 'HistoryResult added: $added, deleted: $deleted, existing: $existing, notFound: $notFound';
  }
}

class ResultAction {
  int movies;
  int episodes;
  int shows;
  int seasons;

  ResultAction({
    this.movies,
    this.episodes,
    this.seasons,
    this.shows,
  });

  ResultAction copyWith({
    int movies,
    int episodes,
    int shows,
    int seasons,
  }) =>
      ResultAction(
        movies: movies ?? this.movies,
        episodes: episodes ?? this.episodes,
        shows: shows ?? this.shows,
        seasons: seasons ?? this.seasons,
      );

  factory ResultAction.fromJson(Map<String, dynamic> json) => ResultAction(
        movies: json["movies"] == null ? null : json["movies"],
        episodes: json["episodes"] == null ? null : json["episodes"],
        shows: json["shows"] == null ? null : json["shows"],
        seasons: json["seasons"] == null ? null : json["seasons"],
      );

  Map<String, dynamic> toJson() => {
        "movies": movies == null ? null : movies,
        "episodes": episodes == null ? null : episodes,
        "shows": shows == null ? null : shows,
        "seasons": seasons == null ? null : seasons,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResultAction &&
        o.movies == movies &&
        o.episodes == episodes &&
        o.shows == shows &&
        o.seasons == seasons;
  }

  @override
  int get hashCode {
    return movies.hashCode ^
        episodes.hashCode ^
        shows.hashCode ^
        seasons.hashCode;
  }

  @override
  String toString() {
    return 'ResultAction movies: $movies, episodes: $episodes, shows: $shows, seasons: $seasons';
  }
}

class NotFound {
  List<Movie> movies;
  List<Show> shows;
  List<Season> seasons;
  List<Episode> episodes;
  List<int> ids;

  NotFound({
    this.movies,
    this.shows,
    this.seasons,
    this.episodes,
    this.ids,
  });

  NotFound copyWith({
    List<Movie> movies,
    List<Show> shows,
    List<Season> seasons,
    List<Episode> episodes,
    List<int> ids,
  }) =>
      NotFound(
        movies: movies ?? this.movies,
        shows: shows ?? this.shows,
        seasons: seasons ?? this.seasons,
        episodes: episodes ?? this.episodes,
        ids: ids ?? this.ids,
      );

  factory NotFound.fromJson(Map<String, dynamic> json) => NotFound(
        movies: json["movies"] == null
            ? null
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        shows: json["shows"] == null
            ? null
            : List<dynamic>.from(json["shows"].map((x) => Show.fromJson(x))),
        seasons: json["seasons"] == null
            ? null
            : List<dynamic>.from(
                json["seasons"].map((x) => Season.fromJson(x))),
        episodes: json["episodes"] == null
            ? null
            : List<dynamic>.from(
                json["episodes"].map((x) => Episode.fromJson(x))),
        ids: json["ids"] == null
            ? null
            : List<int>.from(json["ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "movies": movies == null
            ? null
            : List<dynamic>.from(movies.map((x) => x.toJson())),
        "shows": shows == null
            ? null
            : List<dynamic>.from(shows.map((x) => x.toJson())),
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
        "ids": ids == null ? null : List<dynamic>.from(ids.map((x) => x)),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NotFound &&
        o.movies == movies &&
        o.shows == shows &&
        o.seasons == seasons &&
        o.episodes == episodes &&
        o.ids == ids;
  }

  @override
  int get hashCode {
    return movies.hashCode ^
        shows.hashCode ^
        seasons.hashCode ^
        episodes.hashCode ^
        ids.hashCode;
  }

  @override
  String toString() {
    return 'NotFound movies: $movies, shows: $shows, seasons: $seasons, episodes: $episodes, ids: $ids';
  }
}
