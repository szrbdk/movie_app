class Airs {
  String day;
  String time;
  String timezone;

  Airs({
    this.day,
    this.time,
    this.timezone,
  });

  Airs copyWith({
    String day,
    String time,
    String timezone,
  }) =>
      Airs(
        day: day ?? this.day,
        time: time ?? this.time,
        timezone: timezone ?? this.timezone,
      );

  factory Airs.fromJson(Map<String, dynamic> json) => Airs(
        day: json["day"] == null ? null : json["day"],
        time: json["time"] == null ? null : json["time"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "time": time == null ? null : time,
        "timezone": timezone == null ? null : timezone,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Airs &&
        o.day == day &&
        o.time == time &&
        o.timezone == timezone;
  }

  @override
  int get hashCode => day.hashCode ^ time.hashCode ^ timezone.hashCode;

  @override
  String toString() => 'Airs day: $day, time: $time, timezone: $timezone';
}
