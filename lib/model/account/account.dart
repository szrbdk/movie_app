class Account {
  String timezone;
  String dateFormat;
  bool time24Hr;
  String coverImage;
  String token;

  Account({
    this.timezone,
    this.dateFormat,
    this.time24Hr,
    this.coverImage,
    this.token,
  });

  Account copyWith({
    String timezone,
    String dateFormat,
    bool time24Hr,
    String coverImage,
    String token,
  }) =>
      Account(
        timezone: timezone ?? this.timezone,
        dateFormat: dateFormat ?? this.dateFormat,
        time24Hr: time24Hr ?? this.time24Hr,
        coverImage: coverImage ?? this.coverImage,
        token: token ?? this.token,
      );

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        timezone: json["timezone"] == null ? null : json["timezone"],
        dateFormat: json["date_format"] == null ? null : json["date_format"],
        time24Hr: json["time_24hr"] == null ? null : json["time_24hr"],
        coverImage: json["cover_image"] == null ? null : json["cover_image"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone == null ? null : timezone,
        "date_format": dateFormat == null ? null : dateFormat,
        "time_24hr": time24Hr == null ? null : time24Hr,
        "cover_image": coverImage == null ? null : coverImage,
        "token": token == null ? null : token,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Account &&
        o.timezone == timezone &&
        o.dateFormat == dateFormat &&
        o.time24Hr == time24Hr &&
        o.coverImage == coverImage &&
        o.token == token;
  }

  @override
  int get hashCode {
    return timezone.hashCode ^
        dateFormat.hashCode ^
        time24Hr.hashCode ^
        coverImage.hashCode ^
        token.hashCode;
  }

  @override
  String toString() {
    return 'Account timezone: $timezone, dateFormat: $dateFormat, time24Hr: $time24Hr, coverImage: $coverImage, token: $token';
  }
}
