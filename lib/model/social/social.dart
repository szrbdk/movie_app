class Social {
  int friends;
  int followers;
  int following;

  Social({
    this.friends,
    this.followers,
    this.following,
  });

  Social copyWith({
    int friends,
    int followers,
    int following,
  }) =>
      Social(
        friends: friends ?? this.friends,
        followers: followers ?? this.followers,
        following: following ?? this.following,
      );

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        friends: json["friends"] == null ? null : json["friends"],
        followers: json["followers"] == null ? null : json["followers"],
        following: json["following"] == null ? null : json["following"],
      );

  Map<String, dynamic> toJson() => {
        "friends": friends == null ? null : friends,
        "followers": followers == null ? null : followers,
        "following": following == null ? null : following,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Social &&
        o.friends == friends &&
        o.followers == followers &&
        o.following == following;
  }

  @override
  int get hashCode =>
      friends.hashCode ^ followers.hashCode ^ following.hashCode;

  @override
  String toString() =>
      'Social friends: $friends, followers: $followers, following: $following';
}
