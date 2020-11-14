import 'dart:convert';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

List<SyncLastWatched> lastWatchedFromJson(String str) =>
    List<SyncLastWatched>.from(
        json.decode(str).map((x) => SyncLastWatched.fromJson(x)));

String lastWatchedToJson(List<SyncLastWatched> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyncLastWatched {
  int plays;
  DateTime lastWatchedAt;
  DateTime lastUpdatedAt;
  DateTime resetAt;
  Show show;
  List<SyncSeason> seasons;
  Movie movie;

  SyncLastWatched({
    this.plays,
    this.lastWatchedAt,
    this.lastUpdatedAt,
    this.resetAt,
    this.show,
    this.seasons,
    this.movie,
  });

  SyncLastWatched copyWith({
    int plays,
    DateTime lastWatchedAt,
    DateTime lastUpdatedAt,
    DateTime resetAt,
    Show show,
    List<SyncSeason> seasons,
    Movie movie,
  }) =>
      SyncLastWatched(
        plays: plays ?? this.plays,
        lastWatchedAt: lastWatchedAt ?? this.lastWatchedAt,
        lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
        resetAt: resetAt ?? this.resetAt,
        show: show ?? this.show,
        seasons: seasons ?? this.seasons,
        movie: movie ?? this.movie,
      );

  factory SyncLastWatched.fromJson(Map<String, dynamic> json) =>
      SyncLastWatched(
        plays: json["plays"] == null ? null : json["plays"],
        lastWatchedAt: json["last_watched_at"] == null
            ? null
            : DateTime.parse(json["last_watched_at"]),
        lastUpdatedAt: json["last_updated_at"] == null
            ? null
            : DateTime.parse(json["last_updated_at"]),
        resetAt:
            json["reset_at"] == null ? null : DateTime.parse(json["reset_at"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        seasons: json["seasons"] == null
            ? null
            : List<SyncSeason>.from(
                json["seasons"].map((x) => SyncSeason.fromJson(x))),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "plays": plays == null ? null : plays,
        "last_watched_at":
            lastWatchedAt == null ? null : lastWatchedAt.toIso8601String(),
        "last_updated_at":
            lastUpdatedAt == null ? null : lastUpdatedAt.toIso8601String(),
        "reset_at": resetAt == null ? null : resetAt.toIso8601String(),
        "show": show == null ? null : show.toJson(),
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "movie": movie == null ? null : movie.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SyncLastWatched &&
        o.plays == plays &&
        o.lastWatchedAt == lastWatchedAt &&
        o.lastUpdatedAt == lastUpdatedAt &&
        o.resetAt == resetAt &&
        o.show == show &&
        o.seasons == seasons &&
        o.movie == movie;
  }

  @override
  int get hashCode {
    return plays.hashCode ^
        lastWatchedAt.hashCode ^
        lastUpdatedAt.hashCode ^
        resetAt.hashCode ^
        show.hashCode ^
        seasons.hashCode ^
        movie.hashCode;
  }

  @override
  String toString() {
    return 'SyncLastWatched plays: $plays, lastWatchedAt: $lastWatchedAt, lastUpdatedAt: $lastUpdatedAt, resetAt: $resetAt, show: $show, seasons: $seasons, movie: $movie';
  }
}

class SyncSeason {
  int number;
  List<SyncEpisode> episodes;

  SyncSeason({
    this.number,
    this.episodes,
  });

  SyncSeason copyWith({
    int number,
    List<SyncEpisode> episodes,
  }) =>
      SyncSeason(
        number: number ?? this.number,
        episodes: episodes ?? this.episodes,
      );

  factory SyncSeason.fromJson(Map<String, dynamic> json) => SyncSeason(
        number: json["number"] == null ? null : json["number"],
        episodes: json["episodes"] == null
            ? null
            : List<SyncEpisode>.from(
                json["episodes"].map((x) => SyncEpisode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SyncSeason && o.number == number && o.episodes == episodes;
  }

  @override
  int get hashCode => number.hashCode ^ episodes.hashCode;

  @override
  String toString() => 'SyncSeason number: $number, episodes: $episodes';
}

class SyncEpisode {
  int number;
  int plays;
  DateTime lastWatchedAt;

  SyncEpisode({
    this.number,
    this.plays,
    this.lastWatchedAt,
  });

  SyncEpisode copyWith({
    int number,
    int plays,
    DateTime lastWatchedAt,
  }) =>
      SyncEpisode(
        number: number ?? this.number,
        plays: plays ?? this.plays,
        lastWatchedAt: lastWatchedAt ?? this.lastWatchedAt,
      );

  factory SyncEpisode.fromJson(Map<String, dynamic> json) => SyncEpisode(
        number: json["number"] == null ? null : json["number"],
        plays: json["plays"] == null ? null : json["plays"],
        lastWatchedAt: json["last_watched_at"] == null
            ? null
            : DateTime.parse(json["last_watched_at"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "plays": plays == null ? null : plays,
        "last_watched_at":
            lastWatchedAt == null ? null : lastWatchedAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SyncEpisode &&
        o.number == number &&
        o.plays == plays &&
        o.lastWatchedAt == lastWatchedAt;
  }

  @override
  int get hashCode => number.hashCode ^ plays.hashCode ^ lastWatchedAt.hashCode;

  @override
  String toString() =>
      'SyncEpisode number: $number, plays: $plays, lastWatchedAt: $lastWatchedAt';
}
