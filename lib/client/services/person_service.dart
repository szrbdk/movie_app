import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/people/people.dart';
import 'package:progress_follower/model/person/person.dart';

class PersonService {
  Future<Person> summary(String slug, Map<String, dynamic> parameters) {
    String path = "people/$slug";
    return RestClient().getRequest<Person, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => Person.fromJson(data),
    );
  }

  Future<People> cast(
      String slug, String type, Map<String, dynamic> parameters) {
    String path = "people/$slug/$type";
    return RestClient().getRequest<People, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => People.fromJson(data),
    );
  }
}
