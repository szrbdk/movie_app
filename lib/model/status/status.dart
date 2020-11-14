class Status {
  int plays;
  int watched;
  int minutes;
  int collected;
  int ratings;
  int comments;

  Status({
    this.plays,
    this.watched,
    this.minutes,
    this.collected,
    this.ratings,
    this.comments,
  });

  Status copyWith({
    int plays,
    int watched,
    int minutes,
    int collected,
    int ratings,
    int comments,
  }) =>
      Status(
        plays: plays ?? this.plays,
        watched: watched ?? this.watched,
        minutes: minutes ?? this.minutes,
        collected: collected ?? this.collected,
        ratings: ratings ?? this.ratings,
        comments: comments ?? this.comments,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        plays: json["plays"] == null ? null : json["plays"],
        watched: json["watched"] == null ? null : json["watched"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        collected: json["collected"] == null ? null : json["collected"],
        ratings: json["ratings"] == null ? null : json["ratings"],
        comments: json["comments"] == null ? null : json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "plays": plays == null ? null : plays,
        "watched": watched == null ? null : watched,
        "minutes": minutes == null ? null : minutes,
        "collected": collected == null ? null : collected,
        "ratings": ratings == null ? null : ratings,
        "comments": comments == null ? null : comments,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Status &&
        o.plays == plays &&
        o.watched == watched &&
        o.minutes == minutes &&
        o.collected == collected &&
        o.ratings == ratings &&
        o.comments == comments;
  }

  @override
  int get hashCode {
    return plays.hashCode ^
        watched.hashCode ^
        minutes.hashCode ^
        collected.hashCode ^
        ratings.hashCode ^
        comments.hashCode;
  }

  @override
  String toString() {
    return 'Status plays: $plays, watched: $watched, minutes: $minutes, collected: $collected, ratings: $ratings, comments: $comments';
  }
}
