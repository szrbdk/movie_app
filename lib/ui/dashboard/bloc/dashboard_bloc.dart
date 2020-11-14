import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:progress_follower/client/services/image_service.dart';
import 'package:progress_follower/client/services/show_service.dart';
import 'package:progress_follower/client/services/sync_service.dart';
import 'package:progress_follower/client/services/user_service.dart';
import 'package:progress_follower/manager/session_manager.dart';
import 'package:progress_follower/model/show/watched_history/watched_history.dart';
import 'package:progress_follower/model/sync/last_watched/last_watched.dart';
import 'package:progress_follower/model/tmdb_image/tmdb_image.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/model/user_stats/user_stats.dart';
import 'package:progress_follower/ui/dashboard/bloc/dashboard_event.dart';
import 'package:progress_follower/ui/dashboard/bloc/dashboard_state.dart';
import 'package:progress_follower/ui/dashboard/model/last_watched_show_model.dart';
import 'package:progress_follower/utils/variables.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState());

  int min = 0, max = 10;

  UserSettings myProfile;
  UserStats myStats;
  List<SyncLastWatched> showActivity = <SyncLastWatched>[];
  List<LastWatchedShowModel> showHistory = <LastWatchedShowModel>[];


  @override
  String toString() {
    return "DashboardBloc";
  }

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is BeginEvent) {
      yield DashboardStartState();
      try {
        showActivity.clear();
        showHistory.clear();
        myProfile = await SessionManager.getSavedMyProfile();
        await statsAndActivitiesFn();
        await lastWatchedListFn();
        await getImagesFn();
        showHistory.sort((i, j) => historySortFn(j, i));
        yield DashboardCompletedState(myProfile, myStats, showHistory);
      } catch (error) {
        yield DashboardErrorState(error);
      }
    }
  }

  Future getImagesFn() async {
    List<Future> imageFutures = <Future>[];
    showHistory.forEach((f) {
      imageFutures.add(getShowImages(f.tmdb, "en").then((res) {
        return f.images = res;
      }).then((_) {
        if (f.posters == null ||
            f.posters.isEmpty ||
            f.backdrops == null ||
            f.backdrops.isEmpty) {
          getShowImages(f.tmdb, null).then((value) {
            if (f.posters == null || f.posters.isEmpty) {
              f.posters = value.posters;
            }
            if (f.backdrops == null || f.backdrops.isEmpty) {
              f.backdrops = value.backdrops;
            }
          });
        }
      }));
    });
    await Future.wait(imageFutures);
  }

  int historySortFn(LastWatchedShowModel j, LastWatchedShowModel i) {
    return j.watchedEpisodes.lastWatchedAt
        .compareTo(i.watchedEpisodes.lastWatchedAt);
  }

  Future statsAndActivitiesFn() async {
    List<Future> futures = <Future>[];
    futures.add(getMyStats(myProfile.user.ids.slug).then((res) {
      myStats = res;
    }));
    futures.add(getWatchedShows().then((res) {
      showActivity.addAll(res);
    }));
    await Future.wait(futures);
  }

  Future lastWatchedListFn() async {
    List<Future> showFutures = <Future>[];
    int lastWatchedLenght = 0;
    while (isListCompleted(lastWatchedLenght)) {
      showActivity.sublist(min, max).forEach((f) {
        showFutures.add(getLastWatchedEpisodes(f.show.ids.slug).then((res) {
          if (res.aired != res.completed) {
            showHistory.add(LastWatchedShowModel(
              show: f,
              watchedEpisodes: res,
            ));
            lastWatchedLenght++;
          }
        }));
      });
      await Future.wait(showFutures);
      min = max;
      max = max + 10 - lastWatchedLenght;
      if (max > showActivity.length) max = showActivity.length;
      print("$min - $max - $lastWatchedLenght");
    }
    print("While over");
  }

  bool isListCompleted(int lastWatchedLenght) {
    return lastWatchedLenght >= 6
        ? false
        : min >= showActivity.length ? false : true;
  }

  Future<TmdbImage> getShowImages(int tmdbId, String language) {
    Completer completer = Completer<TmdbImage>();
    ImageService().show(tmdbId, language).then((res) {
      if (res != null) {
        completer.complete(res);
      } else {
        completer.completeError("Getting image failed for $tmdbId");
      }
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }

  Future<UserStats> getMyStats(String slug) {
    Completer completer = Completer<UserStats>();
    UserService().stats(slug).then((result) {
      if (result != null) {
        completer.complete(result);
      } else {
        completer.completeError("Loading My Stats Failed");
      }
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }

  Future<List<SyncLastWatched>> getWatchedShows() {
    Completer completer = Completer<List<SyncLastWatched>>();
    SyncService().watched(Types.shows,
        {ParameterKeys.extended: ParameterValues.noSeasons}).then((res) {
      if (res != null) {
        completer.complete(res);
      } else {
        completer.completeError("Loading last watched failed");
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<WatchedHistory> getLastWatchedEpisodes(String slug) {
    Completer completer = Completer<WatchedHistory>();
    ShowService().watchedProgress(slug).then((res) {
      if (res != null) {
        completer.complete(res);
      } else {
        completer.completeError("Error last watched episode on $slug");
      }
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
