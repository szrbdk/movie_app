class Connections {
  bool facebook;
  bool twitter;
  bool google;
  bool tumblr;
  bool medium;
  bool slack;

  Connections({
    this.facebook,
    this.twitter,
    this.google,
    this.tumblr,
    this.medium,
    this.slack,
  });

  Connections copyWith({
    bool facebook,
    bool twitter,
    bool google,
    bool tumblr,
    bool medium,
    bool slack,
  }) =>
      Connections(
        facebook: facebook ?? this.facebook,
        twitter: twitter ?? this.twitter,
        google: google ?? this.google,
        tumblr: tumblr ?? this.tumblr,
        medium: medium ?? this.medium,
        slack: slack ?? this.slack,
      );

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        google: json["google"] == null ? null : json["google"],
        tumblr: json["tumblr"] == null ? null : json["tumblr"],
        medium: json["medium"] == null ? null : json["medium"],
        slack: json["slack"] == null ? null : json["slack"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "google": google == null ? null : google,
        "tumblr": tumblr == null ? null : tumblr,
        "medium": medium == null ? null : medium,
        "slack": slack == null ? null : slack,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Connections &&
        o.facebook == facebook &&
        o.twitter == twitter &&
        o.google == google &&
        o.tumblr == tumblr &&
        o.medium == medium &&
        o.slack == slack;
  }

  @override
  int get hashCode {
    return facebook.hashCode ^
        twitter.hashCode ^
        google.hashCode ^
        tumblr.hashCode ^
        medium.hashCode ^
        slack.hashCode;
  }

  @override
  String toString() {
    return 'Connections facebook: $facebook, twitter: $twitter, google: $google, tumblr: $tumblr, medium: $medium, slack: $slack';
  }
}
