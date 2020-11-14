import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/certification/certifications.dart';

class CertificationService {
  /// [type] => [movies,shows]
  Future<Certifications> certifications(String type) {
    String path = "certifications/$type";
    return RestClient().getRequest<Certifications, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) => Certifications.fromJson(data),
    );
  }
}
