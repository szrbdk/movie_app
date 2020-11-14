import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/countries/countries.dart';

class CountryService {
  /// [type] => [movies,shows]
  Future<List<Country>> countries(String type) {
    String path = "countries/$type";
    return RestClient().getRequest<List<Country>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) {
        List<Country> list = List<Country>();
        data.forEach((item) => list.add(Country.fromJson(item)));
        return list;
      },
    );
  }
}
