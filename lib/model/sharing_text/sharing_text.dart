class SharingText {
  String watching;
  String watched;
  String rated;

  SharingText({
    this.watching,
    this.watched,
    this.rated,
  });

  SharingText copyWith({
    String watching,
    String watched,
    String rated,
  }) =>
      SharingText(
        watching: watching ?? this.watching,
        watched: watched ?? this.watched,
        rated: rated ?? this.rated,
      );

  factory SharingText.fromJson(Map<String, dynamic> json) => SharingText(
        watching: json["watching"] == null ? null : json["watching"],
        watched: json["watched"] == null ? null : json["watched"],
        rated: json["rated"] == null ? null : json["rated"],
      );

  Map<String, dynamic> toJson() => {
        "watching": watching == null ? null : watching,
        "watched": watched == null ? null : watched,
        "rated": rated == null ? null : rated,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SharingText &&
        o.watching == watching &&
        o.watched == watched &&
        o.rated == rated;
  }

  @override
  int get hashCode => watching.hashCode ^ watched.hashCode ^ rated.hashCode;

  @override
  String toString() =>
      'SharingText watching: $watching, watched: $watched, rated: $rated';
}
