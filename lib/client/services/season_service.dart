import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/episode/episode.dart';
import 'package:progress_follower/model/people/people.dart';
import 'package:progress_follower/model/season/season.dart';
import 'package:progress_follower/model/stats/stats.dart';

class SeasonService {
  Future<List<Season>> seasons(String slug, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons";
    return RestClient().getRequest<List<Season>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Season> list = List<Season>();
        data.forEach((item) => list.add(Season.fromJson(item)));
        return list;
      },
    );
  }

  Future<List<Episode>> episodes(
      String slug, int season, Map<String, dynamic> parameters) {
    String path = "shows/$slug/seasons/$season";
    return RestClient().getRequest<List<Episode>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Episode> list = List<Episode>();
        data.forEach((item) => list.add(Episode.fromJson(item)));
        return list;
      },
    );
  }

  Future<People> people(
    String slug,
    int season,
    Map<String, dynamic> parameters,
  ) {
    String path = "shows/$slug/seasons/$season/people";
    return RestClient().getRequest<People, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => People.fromJson(data),
    );
  }

  Future<Stats> stats(
    String slug,
    int season,
    Map<String, dynamic> parameters,
  ) {
    String path = "shows/$slug/seasons/$season/stats";
    return RestClient().getRequest<Stats, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Stats.fromJson(data),
    );
  }
}
