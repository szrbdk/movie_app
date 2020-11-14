import 'dart:convert';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

class Rating {
  double rating;
  int votes;
  int total;
  Distribution distribution;

  Rating({
    this.rating,
    this.votes,
    this.total,
    this.distribution,
  });

  Rating copyWith({
    double rating,
    int votes,
    int total,
    Distribution distribution,
  }) =>
      Rating(
        rating: rating ?? this.rating,
        votes: votes ?? this.votes,
        total: total ?? this.total,
        distribution: distribution ?? this.distribution,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        votes: json["votes"] == null ? null : json["votes"],
        total: json["total"] == null ? null : json["total"],
        distribution: json["distribution"] == null
            ? null
            : Distribution.fromJson(json["distribution"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating == null ? null : rating,
        "votes": votes == null ? null : votes,
        "total": total == null ? null : total,
        "distribution": distribution == null ? null : distribution.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Rating &&
        o.rating == rating &&
        o.votes == votes &&
        o.total == total &&
        o.distribution == distribution;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        votes.hashCode ^
        total.hashCode ^
        distribution.hashCode;
  }

  @override
  String toString() {
    return 'Rating rating: $rating, votes: $votes, total: $total, distribution: $distribution';
  }
}

class Distribution {
  int the1;
  int the2;
  int the3;
  int the4;
  int the5;
  int the6;
  int the7;
  int the8;
  int the9;
  int the10;

  Distribution({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
  });

  Distribution copyWith({
    int the1,
    int the2,
    int the3,
    int the4,
    int the5,
    int the6,
    int the7,
    int the8,
    int the9,
    int the10,
  }) =>
      Distribution(
        the1: the1 ?? this.the1,
        the2: the2 ?? this.the2,
        the3: the3 ?? this.the3,
        the4: the4 ?? this.the4,
        the5: the5 ?? this.the5,
        the6: the6 ?? this.the6,
        the7: the7 ?? this.the7,
        the8: the8 ?? this.the8,
        the9: the9 ?? this.the9,
        the10: the10 ?? this.the10,
      );

  factory Distribution.fromJson(Map<String, dynamic> json) => Distribution(
        the1: json["1"] == null ? null : json["1"],
        the2: json["2"] == null ? null : json["2"],
        the3: json["3"] == null ? null : json["3"],
        the4: json["4"] == null ? null : json["4"],
        the5: json["5"] == null ? null : json["5"],
        the6: json["6"] == null ? null : json["6"],
        the7: json["7"] == null ? null : json["7"],
        the8: json["8"] == null ? null : json["8"],
        the9: json["9"] == null ? null : json["9"],
        the10: json["10"] == null ? null : json["10"],
      );

  Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : the1,
        "2": the2 == null ? null : the2,
        "3": the3 == null ? null : the3,
        "4": the4 == null ? null : the4,
        "5": the5 == null ? null : the5,
        "6": the6 == null ? null : the6,
        "7": the7 == null ? null : the7,
        "8": the8 == null ? null : the8,
        "9": the9 == null ? null : the9,
        "10": the10 == null ? null : the10,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Distribution &&
        o.the1 == the1 &&
        o.the2 == the2 &&
        o.the3 == the3 &&
        o.the4 == the4 &&
        o.the5 == the5 &&
        o.the6 == the6 &&
        o.the7 == the7 &&
        o.the8 == the8 &&
        o.the9 == the9 &&
        o.the10 == the10;
  }

  @override
  int get hashCode {
    return the1.hashCode ^
        the2.hashCode ^
        the3.hashCode ^
        the4.hashCode ^
        the5.hashCode ^
        the6.hashCode ^
        the7.hashCode ^
        the8.hashCode ^
        the9.hashCode ^
        the10.hashCode;
  }

  @override
  String toString() {
    return 'Distribution the1: $the1, the2: $the2, the3: $the3, the4: $the4, the5: $the5, the6: $the6, the7: $the7, the8: $the8, the9: $the9, the10: $the10';
  }
}
