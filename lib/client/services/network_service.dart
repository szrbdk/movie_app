import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/network/network.dart';

class NetworkService {
  Future<List<Network>> networks() {
    String path = "networks";
    return RestClient().getRequest<List<Network>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) {
        List<Network> list = List<Network>();
        data.forEach((item) => list.add(Network.fromJson(item)));
        return list;
      },
    );
  }
}
