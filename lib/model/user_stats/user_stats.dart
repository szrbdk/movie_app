import 'dart:convert';
import 'package:progress_follower/model/rating/rating.dart';
import 'package:progress_follower/model/social/social.dart';
import 'package:progress_follower/model/status/status.dart';

UserStats userStatsFromJson(String str) => UserStats.fromJson(json.decode(str));

String userStatsToJson(UserStats data) => json.encode(data.toJson());

class UserStats {
  Status movies;
  Status shows;
  Status seasons;
  Status episodes;
  Social network;
  Rating ratings;

  UserStats({
    this.movies,
    this.shows,
    this.seasons,
    this.episodes,
    this.network,
    this.ratings,
  });

  UserStats copyWith({
    Status movies,
    Status shows,
    Status seasons,
    Status episodes,
    Social network,
    Rating ratings,
  }) =>
      UserStats(
        movies: movies ?? this.movies,
        shows: shows ?? this.shows,
        seasons: seasons ?? this.seasons,
        episodes: episodes ?? this.episodes,
        network: network ?? this.network,
        ratings: ratings ?? this.ratings,
      );

  factory UserStats.fromJson(Map<String, dynamic> json) => UserStats(
        movies: json["movies"] == null ? null : Status.fromJson(json["movies"]),
        shows: json["shows"] == null ? null : Status.fromJson(json["shows"]),
        seasons:
            json["seasons"] == null ? null : Status.fromJson(json["seasons"]),
        episodes:
            json["episodes"] == null ? null : Status.fromJson(json["episodes"]),
        network:
            json["network"] == null ? null : Social.fromJson(json["network"]),
        ratings:
            json["ratings"] == null ? null : Rating.fromJson(json["ratings"]),
      );

  Map<String, dynamic> toJson() => {
        "movies": movies == null ? null : movies.toJson(),
        "shows": shows == null ? null : shows.toJson(),
        "seasons": seasons == null ? null : seasons.toJson(),
        "episodes": episodes == null ? null : episodes.toJson(),
        "network": network == null ? null : network.toJson(),
        "ratings": ratings == null ? null : ratings.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserStats &&
        o.movies == movies &&
        o.shows == shows &&
        o.seasons == seasons &&
        o.episodes == episodes &&
        o.network == network &&
        o.ratings == ratings;
  }

  @override
  int get hashCode {
    return movies.hashCode ^
        shows.hashCode ^
        seasons.hashCode ^
        episodes.hashCode ^
        network.hashCode ^
        ratings.hashCode;
  }

  @override
  String toString() {
    return 'UserStats movies: $movies, shows: $shows, seasons: $seasons, episodes: $episodes, network: $network, ratings: $ratings';
  }
}
