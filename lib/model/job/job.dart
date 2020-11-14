import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/person/person.dart';
import 'package:progress_follower/model/show/show.dart';

class Job {
  String job;
  List<String> jobs;
  int episodeCount;
  Show show;
  Movie movie;

  Person person;

  Job({
    this.job,
    this.jobs,
    this.episodeCount,
    this.show,
    this.movie,
    this.person,
  });

  Job copyWith({
    String job,
    List<String> jobs,
    int episodeCount,
    Show show,
    Movie movie,
    Person person,
  }) =>
      Job(
        job: job ?? this.job,
        jobs: jobs ?? this.jobs,
        episodeCount: episodeCount ?? this.episodeCount,
        show: show ?? this.show,
        movie: movie ?? this.movie,
        person: person ?? this.person,
      );

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        job: json["job"] == null ? null : json["job"],
        jobs: json["jobs"] == null
            ? null
            : List<String>.from(json["jobs"].map((x) => x)),
        episodeCount:
            json["episode_count"] == null ? null : json["episode_count"],
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "job": job == null ? null : job,
        "jobs": jobs == null ? null : List<dynamic>.from(jobs.map((x) => x)),
        "episode_count": episodeCount == null ? null : episodeCount,
        "show": show == null ? null : show.toJson(),
        "movie": movie == null ? null : movie.toJson(),
        "person": person == null ? null : person.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Job &&
        o.job == job &&
        o.jobs == jobs &&
        o.episodeCount == episodeCount &&
        o.show == show &&
        o.movie == movie &&
        o.person == person;
  }

  @override
  int get hashCode {
    return job.hashCode ^
        jobs.hashCode ^
        episodeCount.hashCode ^
        show.hashCode ^
        movie.hashCode ^
        person.hashCode;
  }

  @override
  String toString() {
    return 'Job job: $job, jobs: $jobs, episodeCount: $episodeCount, show: $show, movie: $movie, person: $person';
  }
}
