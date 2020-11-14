import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/genre/genre.dart';

class GenreService {
  /// [type] => [movies,shows]
  Future<List<Genre>> genres(String type) {
    String path = "genres/$type";
    return RestClient().getRequest<List<Genre>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) {
        List<Genre> list = List<Genre>();
        data.forEach((item) => list.add(Genre.fromJson(item)));
        return list;
      },
    );
  }
}
