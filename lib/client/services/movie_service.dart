import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/aliase/aliase.dart';
import 'package:progress_follower/model/item_filter/item_filter.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/people/people.dart';
import 'package:progress_follower/model/rating/rating.dart';
import 'package:progress_follower/model/stats/stats.dart';
import 'package:progress_follower/model/translation/translation.dart';

class MovieService {
  Future<List<ItemFilter>> trending(Map<String, dynamic> parameters) {
    String path = "movies/trending";
    return RestClient().getRequest<List<ItemFilter>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<ItemFilter> list = List<ItemFilter>();
        data.forEach((item) => list.add(ItemFilter.fromJson(item)));
        return list;
      },
    );
  }

  Future<List<Movie>> popular(Map<String, dynamic> parameters) {
    String path = "movies/popular";
    return RestClient().getRequest<List<Movie>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Movie> list = List<Movie>();
        data.forEach((item) => list.add(Movie.fromJson(item)));
        return list;
      },
    );
  }

  /// [period] => [weekly, monthly, yearly, all]
  Future<List<ItemFilter>> played(
      String period, Map<String, dynamic> parameters) {
    String path = "movies/played/$period";
    return RestClient().getRequest<List<ItemFilter>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<ItemFilter> list = List<ItemFilter>();
        data.forEach((item) => list.add(ItemFilter.fromJson(item)));
        return list;
      },
    );
  }

  /// [period] => [weekly, monthly, yearly, all]
  Future<List<ItemFilter>> watched(
      String period, Map<String, dynamic> parameters) {
    String path = "movies/watched/$period";
    return RestClient().getRequest<List<ItemFilter>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<ItemFilter> list = List<ItemFilter>();
        data.forEach((item) => list.add(ItemFilter.fromJson(item)));
        return list;
      },
    );
  }

  /// [period] => [weekly, monthly, yearly, all]
  Future<List<ItemFilter>> anticipated(
      String period, Map<String, dynamic> parameters) {
    String path = "movies/anticipated";
    return RestClient().getRequest<List<ItemFilter>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<ItemFilter> list = List<ItemFilter>();
        data.forEach((item) => list.add(ItemFilter.fromJson(item)));
        return list;
      },
    );
  }

  Future<Movie> summary(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug";
    return RestClient().getRequest<Movie, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Movie.fromJson(data),
    );
  }

  Future<List<Aliase>> aliases(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug/aliases";
    return RestClient().getRequest<List<Aliase>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Aliase> list = List<Aliase>();
        data.forEach((item) => list.add(Aliase.fromJson(item)));
        return list;
      },
    );
  }

  Future<List<Translation>> translations(
      String slug, String language, Map<String, dynamic> parameters) {
    String path = "movies/$slug/translations/$language";
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

  Future<People> people(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug/people";
    return RestClient().getRequest<People, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => People.fromJson(data),
    );
  }

  Future<Rating> ratings(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug/ratings";
    return RestClient().getRequest<Rating, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Rating.fromJson(data),
    );
  }

  Future<List<Movie>> related(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug/related";
    return RestClient().getRequest<List<Movie>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Movie> list = List<Movie>();
        data.forEach((item) => list.add(Movie.fromJson(item)));
        return list;
      },
    );
  }

  Future<Stats> stats(String slug, Map<String, dynamic> parameters) {
    String path = "movies/$slug/stats";
    return RestClient().getRequest<Stats, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Stats.fromJson(data),
    );
  }
}
