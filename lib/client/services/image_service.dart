import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';

class ImageService {
  Map<String, dynamic> parameters = {"api_key": Env.tmdbApiKey};

  Future<TmdbImage> movie(int tmdbId, String language) {
    String path = "movie/$tmdbId/images";
    return RestClient().tmdbGetRequest<TmdbImage, Map<String, dynamic>>(
      path: path,
      language: language,
      parameters: parameters,
      constructor: (data) => TmdbImage.fromJson(data),
    );
  }

  Future<TmdbImage> show(int tmdbId, String language) {
    String path = "tv/$tmdbId/images";
    return RestClient().tmdbGetRequest<TmdbImage, Map<String, dynamic>>(
      path: path,
      language: language,
      parameters: parameters,
      constructor: (data) => TmdbImage.fromJson(data),
    );
  }

  Future<TmdbImage> season(int tmdbId, int seasonNumber, String language) {
    String path = "tv/$tmdbId/season/$seasonNumber/images";
    return RestClient().tmdbGetRequest<TmdbImage, Map<String, dynamic>>(
      path: path,
      language: language,
      parameters: parameters,
      constructor: (data) => TmdbImage.fromJson(data),
    );
  }

  Future<TmdbImage> episode(
      int tmdbId, int seasonNumber, int episodeNumber, String language) {
    String path =
        "tv/$tmdbId/season/$seasonNumber/episode/$episodeNumber/images";
    return RestClient().tmdbGetRequest<TmdbImage, Map<String, dynamic>>(
      path: path,
      language: language,
      parameters: parameters,
      constructor: (data) => TmdbImage.fromJson(data),
    );
  }

  Future<TmdbImage> person(int tmdbId, String language) {
    String path = "person/$tmdbId/images";
    return RestClient().tmdbGetRequest<TmdbImage, Map<String, dynamic>>(
      path: path,
      language: language,
      parameters: parameters,
      constructor: (data) => TmdbImage.fromJson(data),
    );
  }
}
