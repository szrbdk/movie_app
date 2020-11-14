import 'dart:convert';
import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

List<SyncWatchedHistory> syncWatchedHistoryFromJson(String str) =>
    List<SyncWatchedHistory>.from(
        json.decode(str).map((x) => SyncWatchedHistory.fromJson(x)));

String syncWwatchedHistoryToJson(List<SyncWatchedHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyncWatchedHistory {
  int id;
  DateTime watchedAt;
  String action;
  String type;
  Episode episode;
  Show show;
  Movie movie;

  SyncWatchedHistory({
    this.id,
    this.watchedAt,
    this.action,
    this.type,
    this.episode,
    this.show,
    this.movie,
  });

  SyncWatchedHistory copyWith({
    int id,
    DateTime watchedAt,
    String action,
    String type,
    Episode episode,
    Show show,
    Movie movie,
  }) =>
      SyncWatchedHistory(
        id: id ?? this.id,
        watchedAt: watchedAt ?? this.watchedAt,
        action: action ?? this.action,
        type: type ?? this.type,
        episode: episode ?? this.episode,
        show: show ?? this.show,
        movie: movie ?? this.movie,
      );

  factory SyncWatchedHistory.fromJson(Map<String, dynamic> json) =>
      SyncWatchedHistory(
        id: json["id"] == null ? null : json["id"],
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
        action: json["action"] == null ? null : json["action"],
        type: json["type"] == null ? null : json["type"],
        episode:
            json["episode"] == null ? null : Episode.fromJson(json["episode"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "action": action == null ? null : action,
        "type": type == null ? null : type,
        "episode": episode == null ? null : episode.toJson(),
        "show": show == null ? null : show.toJson(),
        "movie": movie == null ? null : movie.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SyncWatchedHistory &&
        o.id == id &&
        o.watchedAt == watchedAt &&
        o.action == action &&
        o.type == type &&
        o.episode == episode &&
        o.show == show &&
        o.movie == movie;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        watchedAt.hashCode ^
        action.hashCode ^
        type.hashCode ^
        episode.hashCode ^
        show.hashCode ^
        movie.hashCode;
  }

  @override
  String toString() {
    return 'SyncWatchedHistory id: $id, watchedAt: $watchedAt, action: $action, type: $type, episode: $episode, show: $show, movie: $movie';
  }
}
