import 'dart:convert';

import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/person/person.dart';
import 'package:progress_follower/model/show/show.dart';

List<SearchResult> searchResultFromJson(String str) => List<SearchResult>.from(
    json.decode(str).map((x) => SearchResult.fromJson(x)));

String searchResultToJson(List<SearchResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResult {
  String type;
  double score;
  Person person;
  Movie movie;
  Episode episode;
  Show show;

  SearchResult({
    this.type,
    this.score,
    this.person,
    this.movie,
    this.episode,
    this.show,
  });

  SearchResult copyWith({
    String type,
    double score,
    Person person,
    Movie movie,
    Episode episode,
    Show show,
  }) =>
      SearchResult(
        type: type ?? this.type,
        score: score ?? this.score,
        person: person ?? this.person,
        movie: movie ?? this.movie,
        episode: episode ?? this.episode,
        show: show ?? this.show,
      );

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        type: json["type"] == null ? null : json["type"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        episode:
            json["episode"] == null ? null : Episode.fromJson(json["episode"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "score": score == null ? null : score,
        "person": person == null ? null : person.toJson(),
        "movie": movie == null ? null : movie.toJson(),
        "episode": episode == null ? null : episode.toJson(),
        "show": show == null ? null : show.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchResult &&
        o.type == type &&
        o.score == score &&
        o.person == person &&
        o.movie == movie &&
        o.episode == episode &&
        o.show == show;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        score.hashCode ^
        person.hashCode ^
        movie.hashCode ^
        episode.hashCode ^
        show.hashCode;
  }

  @override
  String toString() {
    return 'SearchResult type: $type, score: $score, person: $person, movie: $movie, episode: $episode, show: $show';
  }
}
