import 'dart:convert';

import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

List<Calendar> calendarFromJson(String str) =>
    List<Calendar>.from(json.decode(str).map((x) => Calendar.fromJson(x)));

String calendarToJson(List<Calendar> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Calendar {
  DateTime released;
  Movie movie;
  DateTime firstAired;
  Episode episode;
  Show show;

  Calendar({
    this.released,
    this.movie,
    this.firstAired,
    this.episode,
    this.show,
  });

  Calendar copyWith({
    DateTime released,
    Movie movie,
    DateTime firstAired,
    Episode episode,
    Show show,
  }) =>
      Calendar(
        released: released ?? this.released,
        movie: movie ?? this.movie,
        firstAired: firstAired ?? this.firstAired,
        episode: episode ?? this.episode,
        show: show ?? this.show,
      );

  factory Calendar.fromJson(Map<String, dynamic> json) => Calendar(
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        firstAired: json["first_aired"] == null
            ? null
            : DateTime.parse(json["first_aired"]),
        episode:
            json["episode"] == null ? null : Episode.fromJson(json["episode"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "released": released == null
            ? null
            : "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "movie": movie == null ? null : movie.toJson(),
        "first_aired": firstAired == null ? null : firstAired.toIso8601String(),
        "episode": episode == null ? null : episode.toJson(),
        "show": show == null ? null : show.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Calendar &&
        o.released == released &&
        o.movie == movie &&
        o.firstAired == firstAired &&
        o.episode == episode &&
        o.show == show;
  }

  @override
  int get hashCode {
    return released.hashCode ^
        movie.hashCode ^
        firstAired.hashCode ^
        episode.hashCode ^
        show.hashCode;
  }

  @override
  String toString() {
    return 'Calendar released: $released, movie: $movie, firstAired: $firstAired, episode: $episode, show: $show';
  }
}
