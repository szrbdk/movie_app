import 'dart:convert';

import 'package:progress_follower/model/ids/ids.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

HistoryItem historyItemFromJson(String str) =>
    HistoryItem.fromJson(json.decode(str));

String historyItemToJson(HistoryItem data) => json.encode(data.toJson());

class HistoryItem {
  List<Movie> movies;
  List<Show> shows;
  List<Element> seasons;
  List<Element> episodes;
  List<int> ids;

  HistoryItem({
    this.movies,
    this.shows,
    this.seasons,
    this.episodes,
    this.ids,
  });

  HistoryItem copyWith({
    List<Movie> movies,
    List<Show> shows,
    List<Element> seasons,
    List<Element> episodes,
    List<int> ids,
  }) =>
      HistoryItem(
        movies: movies ?? this.movies,
        shows: shows ?? this.shows,
        seasons: seasons ?? this.seasons,
        episodes: episodes ?? this.episodes,
        ids: ids ?? this.ids,
      );

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        movies: json["movies"] == null
            ? null
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        shows: json["shows"] == null
            ? null
            : List<Show>.from(json["shows"].map((x) => Show.fromJson(x))),
        seasons: json["seasons"] == null
            ? null
            : List<Element>.from(
                json["seasons"].map((x) => Element.fromJson(x))),
        episodes: json["episodes"] == null
            ? null
            : List<Element>.from(
                json["episodes"].map((x) => Element.fromJson(x))),
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

    return o is HistoryItem &&
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
    return 'HistoryItem movies: $movies, shows: $shows, seasons: $seasons, episodes: $episodes, ids: $ids';
  }
}

class Element {
  DateTime watchedAt;
  Ids ids;

  Element({
    this.watchedAt,
    this.ids,
  });

  Element copyWith({
    DateTime watchedAt,
    Ids ids,
  }) =>
      Element(
        watchedAt: watchedAt ?? this.watchedAt,
        ids: ids ?? this.ids,
      );

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
      );

  Map<String, dynamic> toJson() => {
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "ids": ids == null ? null : ids.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Element && o.watchedAt == watchedAt && o.ids == ids;
  }

  @override
  int get hashCode => watchedAt.hashCode ^ ids.hashCode;

  @override
  String toString() => 'Element watchedAt: $watchedAt, ids: $ids';
}

class SeasonEpisode {
  DateTime watchedAt;
  int number;

  SeasonEpisode({
    this.watchedAt,
    this.number,
  });

  SeasonEpisode copyWith({
    DateTime watchedAt,
    int number,
  }) =>
      SeasonEpisode(
        watchedAt: watchedAt ?? this.watchedAt,
        number: number ?? this.number,
      );

  factory SeasonEpisode.fromJson(Map<String, dynamic> json) => SeasonEpisode(
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "number": number == null ? null : number,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SeasonEpisode && o.watchedAt == watchedAt && o.number == number;
  }

  @override
  int get hashCode => watchedAt.hashCode ^ number.hashCode;

  @override
  String toString() => 'SeasonEpisode watchedAt: $watchedAt, number: $number';
}
