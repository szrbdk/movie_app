import 'dart:convert';
import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/season/season.dart';
import 'package:progress_follower/model/show/show.dart';

List<Watchlist> watchlistFromJson(String str) =>
    List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
  int rank;
  int id;
  DateTime listedAt;
  String type;
  Show show;
  Movie movie;
  Season season;
  Episode episode;

  Watchlist({
    this.rank,
    this.id,
    this.listedAt,
    this.type,
    this.show,
    this.movie,
    this.season,
    this.episode,
  });

  Watchlist copyWith({
    int rank,
    int id,
    DateTime listedAt,
    String type,
    Show show,
    Movie movie,
    Season season,
    Episode episode,
  }) =>
      Watchlist(
        rank: rank ?? this.rank,
        id: id ?? this.id,
        listedAt: listedAt ?? this.listedAt,
        type: type ?? this.type,
        show: show ?? this.show,
        movie: movie ?? this.movie,
        season: season ?? this.season,
        episode: episode ?? this.episode,
      );

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        rank: json["rank"] == null ? null : json["rank"],
        id: json["id"] == null ? null : json["id"],
        listedAt: json["listed_at"] == null
            ? null
            : DateTime.parse(json["listed_at"]),
        type: json["type"] == null ? null : json["type"],
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
        episode:
            json["episode"] == null ? null : Episode.fromJson(json["episode"]),
      );

  Map<String, dynamic> toJson() => {
        "rank": rank == null ? null : rank,
        "id": id == null ? null : id,
        "listed_at": listedAt == null ? null : listedAt.toIso8601String(),
        "type": type == null ? null : type,
        "show": show == null ? null : show.toJson(),
        "movie": movie == null ? null : movie.toJson(),
        "season": season == null ? null : season.toJson(),
        "episode": episode == null ? null : episode.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Watchlist &&
        o.rank == rank &&
        o.id == id &&
        o.listedAt == listedAt &&
        o.type == type &&
        o.show == show &&
        o.movie == movie &&
        o.season == season &&
        o.episode == episode;
  }

  @override
  int get hashCode {
    return rank.hashCode ^
        id.hashCode ^
        listedAt.hashCode ^
        type.hashCode ^
        show.hashCode ^
        movie.hashCode ^
        season.hashCode ^
        episode.hashCode;
  }

  @override
  String toString() {
    return 'Watchlist rank: $rank, id: $id, listedAt: $listedAt, type: $type, show: $show, movie: $movie, season: $season, episode: $episode';
  }
}
