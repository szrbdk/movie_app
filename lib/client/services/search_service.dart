import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/helpers/service_helpers/search_helper.dart';
import 'package:progress_follower/model/search_result/search_result.dart';

class SearchService {
  Future<List<SearchResult>> search(
      List<String> searchTypeList, Map<String, dynamic> parameters) {
    String searchType = SearchHelper().searchHelper(searchTypeList);
    String path = "search/$searchType";
    return RestClient().getRequest<List<SearchResult>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<SearchResult> list = List<SearchResult>();
        data.forEach((item) => list.add(SearchResult.fromJson(item)));
        return list;
      },
    );
  }
}
