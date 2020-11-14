import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/movie/movie.dart';
import 'package:progress_follower/model/show/show.dart';

class RecommendationService {
  Future<List<Movie>> movie() {
    String path = "recommendations/movies";
    return RestClient().getRequest<List<Movie>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      constructor: (data) {
        List<Movie> list = List<Movie>();
        data.forEach((item) => list.add(Movie.fromJson(item)));
        return list;
      },
    );
  }

  Future<List<Show>> show() {
    String path = "recommendations/shows";
    return RestClient().getRequest<List<Show>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      constructor: (data) {
        List<Show> list = List<Show>();
        data.forEach((item) => list.add(Show.fromJson(item)));
        return list;
      },
    );
  }

  Future<bool> hide(String type, String id) {
    String path = "recommendations/$type/$id";
    return RestClient().deleteRequest(path, true, true);
  }
}
