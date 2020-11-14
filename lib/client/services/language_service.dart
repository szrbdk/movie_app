import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/language/language.dart';

class LanguageService {
  /// [type] => [movies,shows]
  Future<List<Language>> languages(String type) {
    String path = "languages/$type";
    return RestClient().getRequest<List<Language>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) {
        List<Language> list = List<Language>();
        data.forEach((item) => list.add(Language.fromJson(item)));
        return list;
      },
    );
  }
}
