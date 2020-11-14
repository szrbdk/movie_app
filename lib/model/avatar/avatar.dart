class Avatar {
  String full;

  Avatar({
    this.full,
  });

  Avatar copyWith({
    String full,
  }) =>
      Avatar(
        full: full ?? this.full,
      );

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        full: json["full"] == null ? null : json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full == null ? null : full,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Avatar && o.full == full;
  }

  @override
  int get hashCode => full.hashCode;

  @override
  String toString() => 'Avatar full: $full';
}
