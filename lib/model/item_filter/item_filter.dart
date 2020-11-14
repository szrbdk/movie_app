import 'dart:convert';

import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

List<ItemFilter> itemFilterFromJson(String str) =>
    List<ItemFilter>.from(json.decode(str).map((x) => ItemFilter.fromJson(x)));

String itemFilterToJson(List<ItemFilter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemFilter {
  int watchers;
  int watcherCount;
  int playCount;
  int collectedCount;
  int listCount;
  Movie movie;
  Show show;

  ItemFilter({
    this.watchers,
    this.watcherCount,
    this.playCount,
    this.collectedCount,
    this.listCount,
    this.movie,
    this.show,
  });

  ItemFilter copyWith({
    int watchers,
    int watcherCount,
    int playCount,
    int collectedCount,
    int listCount,
    Movie movie,
    Show show,
  }) =>
      ItemFilter(
        watchers: watchers ?? this.watchers,
        watcherCount: watcherCount ?? this.watcherCount,
        playCount: playCount ?? this.playCount,
        collectedCount: collectedCount ?? this.collectedCount,
        listCount: listCount ?? this.listCount,
        movie: movie ?? this.movie,
        show: show ?? this.show,
      );

  factory ItemFilter.fromJson(Map<String, dynamic> json) => ItemFilter(
        watchers: json["watchers"] == null ? null : json["watchers"],
        watcherCount:
            json["watcher_count"] == null ? null : json["watcher_count"],
        playCount: json["play_count"] == null ? null : json["play_count"],
        collectedCount:
            json["collected_count"] == null ? null : json["collected_count"],
        listCount: json["list_count"] == null ? null : json["list_count"],
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "watchers": watchers == null ? null : watchers,
        "watcher_count": watcherCount == null ? null : watcherCount,
        "play_count": playCount == null ? null : playCount,
        "collected_count": collectedCount == null ? null : collectedCount,
        "list_count": listCount == null ? null : listCount,
        "movie": movie == null ? null : movie.toJson(),
        "show": show == null ? null : show.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ItemFilter &&
        o.watchers == watchers &&
        o.watcherCount == watcherCount &&
        o.playCount == playCount &&
        o.collectedCount == collectedCount &&
        o.listCount == listCount &&
        o.movie == movie &&
        o.show == show;
  }

  @override
  int get hashCode {
    return watchers.hashCode ^
        watcherCount.hashCode ^
        playCount.hashCode ^
        collectedCount.hashCode ^
        listCount.hashCode ^
        movie.hashCode ^
        show.hashCode;
  }

  @override
  String toString() {
    return 'ItemFilter watchers: $watchers, watcherCount: $watcherCount, playCount: $playCount, collectedCount: $collectedCount, listCount: $listCount, movie: $movie, show: $show';
  }
}
