import 'dart:convert';

import 'package:progress_follower/model/ids/ids.dart';
import 'package:progress_follower/model/sync/history_item/history_item.dart';

List<Season> seasonFromJson(String str) =>
    List<Season>.from(json.decode(str).map((x) => Season.fromJson(x)));

String seasonToJson(List<Season> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Season {
  int number;
  Ids ids;
  double rating;
  int votes;
  int episodeCount;
  int airedEpisodes;
  String title;
  String overview;
  DateTime firstAired;
  String network;
  DateTime watchedAt;
  List<SeasonEpisode> episodes;

  Season({
    this.number,
    this.ids,
    this.rating,
    this.votes,
    this.episodeCount,
    this.airedEpisodes,
    this.title,
    this.overview,
    this.firstAired,
    this.network,
    this.watchedAt,
    this.episodes,
  });

  Season copyWith({
    int number,
    Ids ids,
    double rating,
    int votes,
    int episodeCount,
    int airedEpisodes,
    String title,
    String overview,
    DateTime firstAired,
    String network,
    DateTime watchedAt,
    List<SeasonEpisode> episodes,
  }) =>
      Season(
        number: number ?? this.number,
        ids: ids ?? this.ids,
        rating: rating ?? this.rating,
        votes: votes ?? this.votes,
        episodeCount: episodeCount ?? this.episodeCount,
        airedEpisodes: airedEpisodes ?? this.airedEpisodes,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        firstAired: firstAired ?? this.firstAired,
        network: network ?? this.network,
        watchedAt: watchedAt ?? this.watchedAt,
        episodes: episodes ?? this.episodes,
      );

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        number: json["number"] == null ? null : json["number"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        votes: json["votes"] == null ? null : json["votes"],
        episodeCount:
            json["episode_count"] == null ? null : json["episode_count"],
        airedEpisodes:
            json["aired_episodes"] == null ? null : json["aired_episodes"],
        title: json["title"] == null ? null : json["title"],
        overview: json["overview"] == null ? null : json["overview"],
        firstAired: json["first_aired"] == null
            ? null
            : DateTime.parse(json["first_aired"]),
        network: json["network"] == null ? null : json["network"],
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
        episodes: json["episodes"] == null
            ? null
            : List<SeasonEpisode>.from(
                json["episodes"].map((x) => SeasonEpisode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "ids": ids == null ? null : ids.toJson(),
        "rating": rating == null ? null : rating,
        "votes": votes == null ? null : votes,
        "episode_count": episodeCount == null ? null : episodeCount,
        "aired_episodes": airedEpisodes == null ? null : airedEpisodes,
        "title": title == null ? null : title,
        "overview": overview == null ? null : overview,
        "first_aired": firstAired == null ? null : firstAired.toIso8601String(),
        "network": network == null ? null : network,
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Season &&
        o.number == number &&
        o.ids == ids &&
        o.rating == rating &&
        o.votes == votes &&
        o.episodeCount == episodeCount &&
        o.airedEpisodes == airedEpisodes &&
        o.title == title &&
        o.overview == overview &&
        o.firstAired == firstAired &&
        o.network == network &&
        o.watchedAt == watchedAt &&
        o.episodes == episodes;
  }

  @override
  int get hashCode {
    return number.hashCode ^
        ids.hashCode ^
        rating.hashCode ^
        votes.hashCode ^
        episodeCount.hashCode ^
        airedEpisodes.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        firstAired.hashCode ^
        network.hashCode ^
        watchedAt.hashCode ^
        episodes.hashCode;
  }

  @override
  String toString() {
    return 'Season number: $number, ids: $ids, rating: $rating, votes: $votes, episodeCount: $episodeCount, airedEpisodes: $airedEpisodes, title: $title, overview: $overview, firstAired: $firstAired, network: $network, watchedAt: $watchedAt, episodes: $episodes';
  }
}
