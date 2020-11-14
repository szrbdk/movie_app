import 'dart:convert';

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));

String statsToJson(Stats data) => json.encode(data.toJson());

class Stats {
  int watchers;
  int plays;
  int collectors;
  int collectedEpisodes;
  int comments;
  int lists;
  int votes;

  Stats({
    this.watchers,
    this.plays,
    this.collectors,
    this.collectedEpisodes,
    this.comments,
    this.lists,
    this.votes,
  });

  Stats copyWith({
    int watchers,
    int plays,
    int collectors,
    int collectedEpisodes,
    int comments,
    int lists,
    int votes,
  }) =>
      Stats(
        watchers: watchers ?? this.watchers,
        plays: plays ?? this.plays,
        collectors: collectors ?? this.collectors,
        collectedEpisodes: collectedEpisodes ?? this.collectedEpisodes,
        comments: comments ?? this.comments,
        lists: lists ?? this.lists,
        votes: votes ?? this.votes,
      );

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        watchers: json["watchers"] == null ? null : json["watchers"],
        plays: json["plays"] == null ? null : json["plays"],
        collectors: json["collectors"] == null ? null : json["collectors"],
        collectedEpisodes: json["collected_episodes"] == null
            ? null
            : json["collected_episodes"],
        comments: json["comments"] == null ? null : json["comments"],
        lists: json["lists"] == null ? null : json["lists"],
        votes: json["votes"] == null ? null : json["votes"],
      );

  Map<String, dynamic> toJson() => {
        "watchers": watchers == null ? null : watchers,
        "plays": plays == null ? null : plays,
        "collectors": collectors == null ? null : collectors,
        "collected_episodes":
            collectedEpisodes == null ? null : collectedEpisodes,
        "comments": comments == null ? null : comments,
        "lists": lists == null ? null : lists,
        "votes": votes == null ? null : votes,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Stats &&
        o.watchers == watchers &&
        o.plays == plays &&
        o.collectors == collectors &&
        o.collectedEpisodes == collectedEpisodes &&
        o.comments == comments &&
        o.lists == lists &&
        o.votes == votes;
  }

  @override
  int get hashCode {
    return watchers.hashCode ^
        plays.hashCode ^
        collectors.hashCode ^
        collectedEpisodes.hashCode ^
        comments.hashCode ^
        lists.hashCode ^
        votes.hashCode;
  }

  @override
  String toString() {
    return 'Stats watchers: $watchers, plays: $plays, collectors: $collectors, collectedEpisodes: $collectedEpisodes, comments: $comments, lists: $lists, votes: $votes';
  }
}
