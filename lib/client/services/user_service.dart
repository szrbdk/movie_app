import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/sync/last_watched/last_watched.dart';
import 'package:progress_follower/model/user/user.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/model/user_stats/user_stats.dart';

class UserService {
  Future<UserSettings> settings(Map<String, dynamic> parameters) {
    String path = "users/settings";
    return RestClient().getRequest<UserSettings, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: parameters,
      constructor: (data) => UserSettings.fromJson(data),
    );
  }

  Future<User> profile(String slug, Map<String, dynamic> parameters) {
    String path = "users/$slug";
    return RestClient().getRequest<User, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) => User.fromJson(data),
    );
  }

  Future<SyncLastWatched> watched(String slug, String type) {
    String path = "users/$slug/watched/$type";
    return RestClient().getRequest<SyncLastWatched, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) => SyncLastWatched.fromJson(data),
    );
  }

  Future<UserStats> stats(String slug) {
    String path = "users/$slug/stats";
    return RestClient().getRequest<UserStats, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: null,
      constructor: (data) => UserStats.fromJson(data),
    );
  }
}
