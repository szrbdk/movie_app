import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/model/show/watched_history/watched_history.dart';
import 'package:progress_follower/model/sync/history_item/history_item.dart';
import 'package:progress_follower/model/sync/history_result/history_result.dart';
import 'package:progress_follower/model/sync/last_activity/last_activity.dart';
import 'package:progress_follower/model/sync/last_watched/last_watched.dart';
import 'package:progress_follower/model/sync/watchlist/watchlist.dart';

class SyncService {
  Future<LastActivity> lastActivity() {
    String path = "sync/last_activities";
    return RestClient().getRequest<LastActivity, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      constructor: (data) => LastActivity.fromJson(data),
    );
  }

  Future<List<SyncLastWatched>> watched(
      String type, Map<String, dynamic> parameters) {
    String path = "sync/watched/$type";
    return RestClient().getRequest<List<SyncLastWatched>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: parameters,
      constructor: (data) {
        List<SyncLastWatched> list = List<SyncLastWatched>();
        data.forEach((item) => list.add(SyncLastWatched.fromJson(item)));
        return list;
      },
    );
  }

  Future<List<WatchedHistory>> history(
      String type, String id, Map<String, dynamic> parameters) {
    String path = id == null ? "sync/history/$type" : "sync/history/$type/$id";
    return RestClient().getRequest<List<WatchedHistory>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: parameters,
      constructor: (data) {
        List<WatchedHistory> list = List<WatchedHistory>();
        data.forEach((item) => list.add(WatchedHistory.fromJson(item)));
        return list;
      },
    );
  }

  Future<HistoryResult> addToHistory(HistoryItem body) {
    String path = "sync/history";
    return RestClient().postRequest<HistoryResult, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      data: body.toJson(),
      constructor: (data) => HistoryResult.fromJson(data),
    );
  }

  Future<HistoryResult> removeFromHistory(HistoryItem body) {
    String path = "sync/history/remove";
    return RestClient().postRequest<HistoryResult, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      data: body.toJson(),
      constructor: (data) => HistoryResult.fromJson(data),
    );
  }

  Future<List<Watchlist>> watchlist(String type, String sort) {
    String path = "sync/watchlist/$type/$sort";
    return RestClient().getRequest<List<Watchlist>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      constructor: (data) {
        List<Watchlist> list = List<Watchlist>();
        data.forEach((item) => list.add(Watchlist.fromJson(item)));
        return list;
      },
    );
  }

  Future<HistoryResult> addToWatchlist(HistoryItem body) {
    String path = "sync/watchlist";
    return RestClient().postRequest<HistoryResult, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      data: body.toJson(),
      constructor: (data) => HistoryResult.fromJson(data),
    );
  }

  Future<HistoryResult> removeFromWatchlist(HistoryItem body) {
    String path = "sync/watchlist/remove";
    return RestClient().postRequest<HistoryResult, Map<String, dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: null,
      data: body.toJson(),
      constructor: (data) => HistoryResult.fromJson(data),
    );
  }
}
