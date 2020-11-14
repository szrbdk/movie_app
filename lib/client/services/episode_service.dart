import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/people/people.dart';
import 'package:progress_follower/model/rating/rating.dart';
import 'package:progress_follower/model/stats/stats.dart';
import 'package:progress_follower/model/translation/translation.dart';

class EpisodeService {
  Future<Episode> summary(
      String slug, int season, int episode, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons/$season/episodes/$episode";
    return RestClient().getRequest<Episode, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Episode.fromJson(data),
    );
  }

  Future<List<Translation>> translation(
    String slug,
    int season,
    int episode,
    String language,
    Map<String, dynamic> parameters,
  ) {
    String path =
        "shows/$slug/seasons/$season/episodes/$episode/translations/$language";
    return RestClient().getRequest<List<Translation>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Translation> list = List<Translation>();
        data.forEach((item) => list.add(Translation.fromJson(item)));
        return list;
      },
    );
  }

  Future<People> people(
      String slug, int season, int episode, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons/$season/episodes/$episode/people";
    return RestClient().getRequest<People, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => People.fromJson(data),
    );
  }

  Future<Rating> rating(
      String slug, int season, int episode, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons/$season/episodes/$episode/ratings";
    return RestClient().getRequest<Rating, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Rating.fromJson(data),
    );
  }

  Future<Stats> stats(
      String slug, int season, int episode, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons/$season/episodes/$episode/stats";
    return RestClient().getRequest<Stats, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Stats.fromJson(data),
    );
  }
}
