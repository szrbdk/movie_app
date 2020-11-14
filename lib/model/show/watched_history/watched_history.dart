import 'dart:convert';

import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/season/season.dart';

WatchedHistory watchedHistoryFromJson(String str) =>
    WatchedHistory.fromJson(json.decode(str));

String watchedHistoryToJson(WatchedHistory data) => json.encode(data.toJson());

class WatchedHistory {
  int aired;
  int completed;
  DateTime lastWatchedAt;
  DateTime resetAt;
  List<Season> seasons;
  List<Season> hiddenSeasons;
  Episode nextEpisode;
  Episode lastEpisode;

  WatchedHistory({
    this.aired,
    this.completed,
    this.lastWatchedAt,
    this.resetAt,
    this.seasons,
    this.hiddenSeasons,
    this.nextEpisode,
    this.lastEpisode,
  });

  WatchedHistory copyWith({
    int aired,
    int completed,
    DateTime lastWatchedAt,
    DateTime resetAt,
    List<Season> seasons,
    List<Season> hiddenSeasons,
    Episode nextEpisode,
    Episode lastEpisode,
  }) =>
      WatchedHistory(
        aired: aired ?? this.aired,
        completed: completed ?? this.completed,
        lastWatchedAt: lastWatchedAt ?? this.lastWatchedAt,
        resetAt: resetAt ?? this.resetAt,
        seasons: seasons ?? this.seasons,
        hiddenSeasons: hiddenSeasons ?? this.hiddenSeasons,
        nextEpisode: nextEpisode ?? this.nextEpisode,
        lastEpisode: lastEpisode ?? this.lastEpisode,
      );

  factory WatchedHistory.fromJson(Map<String, dynamic> json) => WatchedHistory(
        aired: json["aired"] == null ? null : json["aired"],
        completed: json["completed"] == null ? null : json["completed"],
        lastWatchedAt: json["last_watched_at"] == null
            ? null
            : DateTime.parse(json["last_watched_at"]),
        resetAt:
            json["reset_at"] == null ? null : DateTime.parse(json["reset_at"]),
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        hiddenSeasons: json["hidden_seasons"] == null
            ? null
            : List<Season>.from(
                json["hidden_seasons"].map((x) => Season.fromJson(x))),
        nextEpisode: json["next_episode"] == null
            ? null
            : Episode.fromJson(json["next_episode"]),
        lastEpisode: json["last_episode"] == null
            ? null
            : Episode.fromJson(json["last_episode"]),
      );

  Map<String, dynamic> toJson() => {
        "aired": aired == null ? null : aired,
        "completed": completed == null ? null : completed,
        "last_watched_at":
            lastWatchedAt == null ? null : lastWatchedAt.toIso8601String(),
        "reset_at": resetAt == null ? null : resetAt.toIso8601String(),
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "hidden_seasons": hiddenSeasons == null
            ? null
            : List<dynamic>.from(hiddenSeasons.map((x) => x.toJson())),
        "next_episode": nextEpisode == null ? null : nextEpisode.toJson(),
        "last_episode": lastEpisode == null ? null : lastEpisode.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WatchedHistory &&
        o.aired == aired &&
        o.completed == completed &&
        o.lastWatchedAt == lastWatchedAt &&
        o.resetAt == resetAt &&
        o.seasons == seasons &&
        o.hiddenSeasons == hiddenSeasons &&
        o.nextEpisode == nextEpisode &&
        o.lastEpisode == lastEpisode;
  }

  @override
  int get hashCode {
    return aired.hashCode ^
        completed.hashCode ^
        lastWatchedAt.hashCode ^
        resetAt.hashCode ^
        seasons.hashCode ^
        hiddenSeasons.hashCode ^
        nextEpisode.hashCode ^
        lastEpisode.hashCode;
  }

  @override
  String toString() {
    return 'WatchedHistory aired: $aired, completed: $completed, lastWatchedAt: $lastWatchedAt, resetAt: $resetAt, seasons: $seasons, hiddenSeasons: $hiddenSeasons, nextEpisode: $nextEpisode, lastEpisode: $lastEpisode';
  }
}
