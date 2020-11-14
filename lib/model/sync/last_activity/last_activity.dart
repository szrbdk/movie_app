import 'dart:convert';

LastActivity lastActivityFromJson(String str) =>
    LastActivity.fromJson(json.decode(str));

String lastActivityToJson(LastActivity data) => json.encode(data.toJson());

class LastActivity {
  DateTime all;
  Episodes movies;
  Episodes episodes;
  Seasons shows;
  Seasons seasons;
  Comments comments;
  Lists lists;

  LastActivity({
    this.all,
    this.movies,
    this.episodes,
    this.shows,
    this.seasons,
    this.comments,
    this.lists,
  });

  LastActivity copyWith({
    DateTime all,
    Episodes movies,
    Episodes episodes,
    Seasons shows,
    Seasons seasons,
    Comments comments,
    Lists lists,
  }) =>
      LastActivity(
        all: all ?? this.all,
        movies: movies ?? this.movies,
        episodes: episodes ?? this.episodes,
        shows: shows ?? this.shows,
        seasons: seasons ?? this.seasons,
        comments: comments ?? this.comments,
        lists: lists ?? this.lists,
      );

  factory LastActivity.fromJson(Map<String, dynamic> json) => LastActivity(
        all: json["all"] == null ? null : DateTime.parse(json["all"]),
        movies:
            json["movies"] == null ? null : Episodes.fromJson(json["movies"]),
        episodes: json["episodes"] == null
            ? null
            : Episodes.fromJson(json["episodes"]),
        shows: json["shows"] == null ? null : Seasons.fromJson(json["shows"]),
        seasons:
            json["seasons"] == null ? null : Seasons.fromJson(json["seasons"]),
        comments: json["comments"] == null
            ? null
            : Comments.fromJson(json["comments"]),
        lists: json["lists"] == null ? null : Lists.fromJson(json["lists"]),
      );

  Map<String, dynamic> toJson() => {
        "all": all == null ? null : all.toIso8601String(),
        "movies": movies == null ? null : movies.toJson(),
        "episodes": episodes == null ? null : episodes.toJson(),
        "shows": shows == null ? null : shows.toJson(),
        "seasons": seasons == null ? null : seasons.toJson(),
        "comments": comments == null ? null : comments.toJson(),
        "lists": lists == null ? null : lists.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LastActivity &&
        o.all == all &&
        o.movies == movies &&
        o.episodes == episodes &&
        o.shows == shows &&
        o.seasons == seasons &&
        o.comments == comments &&
        o.lists == lists;
  }

  @override
  int get hashCode {
    return all.hashCode ^
        movies.hashCode ^
        episodes.hashCode ^
        shows.hashCode ^
        seasons.hashCode ^
        comments.hashCode ^
        lists.hashCode;
  }

  @override
  String toString() {
    return 'LastActivity all: $all, movies: $movies, episodes: $episodes, shows: $shows, seasons: $seasons, comments: $comments, lists: $lists';
  }
}

class Comments {
  DateTime likedAt;

  Comments({
    this.likedAt,
  });

  Comments copyWith({
    DateTime likedAt,
  }) =>
      Comments(
        likedAt: likedAt ?? this.likedAt,
      );

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        likedAt:
            json["liked_at"] == null ? null : DateTime.parse(json["liked_at"]),
      );

  Map<String, dynamic> toJson() => {
        "liked_at": likedAt == null ? null : likedAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Comments && o.likedAt == likedAt;
  }

  @override
  int get hashCode => likedAt.hashCode;

  @override
  String toString() => 'Comments likedAt: $likedAt';
}

class Episodes {
  DateTime watchedAt;
  DateTime collectedAt;
  DateTime ratedAt;
  DateTime watchlistedAt;
  DateTime commentedAt;
  DateTime pausedAt;
  DateTime hiddenAt;

  Episodes({
    this.watchedAt,
    this.collectedAt,
    this.ratedAt,
    this.watchlistedAt,
    this.commentedAt,
    this.pausedAt,
    this.hiddenAt,
  });

  Episodes copyWith({
    DateTime watchedAt,
    DateTime collectedAt,
    DateTime ratedAt,
    DateTime watchlistedAt,
    DateTime commentedAt,
    DateTime pausedAt,
    DateTime hiddenAt,
  }) =>
      Episodes(
        watchedAt: watchedAt ?? this.watchedAt,
        collectedAt: collectedAt ?? this.collectedAt,
        ratedAt: ratedAt ?? this.ratedAt,
        watchlistedAt: watchlistedAt ?? this.watchlistedAt,
        commentedAt: commentedAt ?? this.commentedAt,
        pausedAt: pausedAt ?? this.pausedAt,
        hiddenAt: hiddenAt ?? this.hiddenAt,
      );

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        watchedAt: json["watched_at"] == null
            ? null
            : DateTime.parse(json["watched_at"]),
        collectedAt: json["collected_at"] == null
            ? null
            : DateTime.parse(json["collected_at"]),
        ratedAt:
            json["rated_at"] == null ? null : DateTime.parse(json["rated_at"]),
        watchlistedAt: json["watchlisted_at"] == null
            ? null
            : DateTime.parse(json["watchlisted_at"]),
        commentedAt: json["commented_at"] == null
            ? null
            : DateTime.parse(json["commented_at"]),
        pausedAt: json["paused_at"] == null
            ? null
            : DateTime.parse(json["paused_at"]),
        hiddenAt: json["hidden_at"] == null
            ? null
            : DateTime.parse(json["hidden_at"]),
      );

  Map<String, dynamic> toJson() => {
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "collected_at":
            collectedAt == null ? null : collectedAt.toIso8601String(),
        "rated_at": ratedAt == null ? null : ratedAt.toIso8601String(),
        "watchlisted_at":
            watchlistedAt == null ? null : watchlistedAt.toIso8601String(),
        "commented_at":
            commentedAt == null ? null : commentedAt.toIso8601String(),
        "paused_at": pausedAt == null ? null : pausedAt.toIso8601String(),
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Episodes &&
        o.watchedAt == watchedAt &&
        o.collectedAt == collectedAt &&
        o.ratedAt == ratedAt &&
        o.watchlistedAt == watchlistedAt &&
        o.commentedAt == commentedAt &&
        o.pausedAt == pausedAt &&
        o.hiddenAt == hiddenAt;
  }

  @override
  int get hashCode {
    return watchedAt.hashCode ^
        collectedAt.hashCode ^
        ratedAt.hashCode ^
        watchlistedAt.hashCode ^
        commentedAt.hashCode ^
        pausedAt.hashCode ^
        hiddenAt.hashCode;
  }

  @override
  String toString() {
    return 'Episodes watchedAt: $watchedAt, collectedAt: $collectedAt, ratedAt: $ratedAt, watchlistedAt: $watchlistedAt, commentedAt: $commentedAt, pausedAt: $pausedAt, hiddenAt: $hiddenAt';
  }
}

class Lists {
  DateTime likedAt;
  DateTime updatedAt;
  DateTime commentedAt;

  Lists({
    this.likedAt,
    this.updatedAt,
    this.commentedAt,
  });

  Lists copyWith({
    DateTime likedAt,
    DateTime updatedAt,
    DateTime commentedAt,
  }) =>
      Lists(
        likedAt: likedAt ?? this.likedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentedAt: commentedAt ?? this.commentedAt,
      );

  factory Lists.fromJson(Map<String, dynamic> json) => Lists(
        likedAt:
            json["liked_at"] == null ? null : DateTime.parse(json["liked_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        commentedAt: json["commented_at"] == null
            ? null
            : DateTime.parse(json["commented_at"]),
      );

  Map<String, dynamic> toJson() => {
        "liked_at": likedAt == null ? null : likedAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "commented_at":
            commentedAt == null ? null : commentedAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Lists &&
        o.likedAt == likedAt &&
        o.updatedAt == updatedAt &&
        o.commentedAt == commentedAt;
  }

  @override
  int get hashCode =>
      likedAt.hashCode ^ updatedAt.hashCode ^ commentedAt.hashCode;

  @override
  String toString() =>
      'Lists likedAt: $likedAt, updatedAt: $updatedAt, commentedAt: $commentedAt';
}

class Seasons {
  DateTime ratedAt;
  DateTime watchlistedAt;
  DateTime commentedAt;
  DateTime hiddenAt;

  Seasons({
    this.ratedAt,
    this.watchlistedAt,
    this.commentedAt,
    this.hiddenAt,
  });

  Seasons copyWith({
    DateTime ratedAt,
    DateTime watchlistedAt,
    DateTime commentedAt,
    DateTime hiddenAt,
  }) =>
      Seasons(
        ratedAt: ratedAt ?? this.ratedAt,
        watchlistedAt: watchlistedAt ?? this.watchlistedAt,
        commentedAt: commentedAt ?? this.commentedAt,
        hiddenAt: hiddenAt ?? this.hiddenAt,
      );

  factory Seasons.fromJson(Map<String, dynamic> json) => Seasons(
        ratedAt:
            json["rated_at"] == null ? null : DateTime.parse(json["rated_at"]),
        watchlistedAt: json["watchlisted_at"] == null
            ? null
            : DateTime.parse(json["watchlisted_at"]),
        commentedAt: json["commented_at"] == null
            ? null
            : DateTime.parse(json["commented_at"]),
        hiddenAt: json["hidden_at"] == null
            ? null
            : DateTime.parse(json["hidden_at"]),
      );

  Map<String, dynamic> toJson() => {
        "rated_at": ratedAt == null ? null : ratedAt.toIso8601String(),
        "watchlisted_at":
            watchlistedAt == null ? null : watchlistedAt.toIso8601String(),
        "commented_at":
            commentedAt == null ? null : commentedAt.toIso8601String(),
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Seasons &&
        o.ratedAt == ratedAt &&
        o.watchlistedAt == watchlistedAt &&
        o.commentedAt == commentedAt &&
        o.hiddenAt == hiddenAt;
  }

  @override
  int get hashCode {
    return ratedAt.hashCode ^
        watchlistedAt.hashCode ^
        commentedAt.hashCode ^
        hiddenAt.hashCode;
  }

  @override
  String toString() {
    return 'Seasons ratedAt: $ratedAt, watchlistedAt: $watchlistedAt, commentedAt: $commentedAt, hiddenAt: $hiddenAt';
  }
}
