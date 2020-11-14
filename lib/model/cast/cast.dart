import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/person/person.dart';
import 'package:progress_follower/model/show/show.dart';

class Cast {
  String character;
  List<String> characters;
  int episodeCount;
  bool seriesRegular;
  Show show;
  Person person;
  Movie movie;

  Cast({
    this.character,
    this.characters,
    this.episodeCount,
    this.seriesRegular,
    this.show,
    this.person,
    this.movie,
  });

  Cast copyWith({
    String character,
    List<String> characters,
    int episodeCount,
    bool seriesRegular,
    Show show,
    Person person,
    Movie movie,
  }) =>
      Cast(
        character: character ?? this.character,
        characters: characters ?? this.characters,
        episodeCount: episodeCount ?? this.episodeCount,
        seriesRegular: seriesRegular ?? this.seriesRegular,
        show: show ?? this.show,
        person: person ?? this.person,
        movie: movie ?? this.movie,
      );

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        character: json["character"] == null ? null : json["character"],
        characters: json["characters"] == null
            ? null
            : List<String>.from(json["characters"].map((x) => x)),
        episodeCount:
            json["episode_count"] == null ? null : json["episode_count"],
        seriesRegular:
            json["series_regular"] == null ? null : json["series_regular"],
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "character": character == null ? null : character,
        "characters": characters == null
            ? null
            : List<dynamic>.from(characters.map((x) => x)),
        "episode_count": episodeCount == null ? null : episodeCount,
        "series_regular": seriesRegular == null ? null : seriesRegular,
        "show": show == null ? null : show.toJson(),
        "person": person == null ? null : person.toJson(),
        "movie": movie == null ? null : movie.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cast &&
        o.character == character &&
        o.characters == characters &&
        o.episodeCount == episodeCount &&
        o.seriesRegular == seriesRegular &&
        o.show == show &&
        o.person == person &&
        o.movie == movie;
  }

  @override
  int get hashCode {
    return character.hashCode ^
        characters.hashCode ^
        episodeCount.hashCode ^
        seriesRegular.hashCode ^
        show.hashCode ^
        person.hashCode ^
        movie.hashCode;
  }

  @override
  String toString() {
    return 'Cast character: $character, characters: $characters, episodeCount: $episodeCount, seriesRegular: $seriesRegular, show: $show, person: $person, movie: $movie';
  }
}
