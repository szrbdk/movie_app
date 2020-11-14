import 'package:equatable/equatable.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/model/user_stats/user_stats.dart';
import 'package:progress_follower/ui/dashboard/model/last_watched_show_model.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => null;
}

class DashboardStartState extends DashboardState {
  @override
  List<Object> get props => null;
}

class DashboardCompletedState extends DashboardState {
  final UserSettings myProfile;
  final UserStats myStats;
  final List<LastWatchedShowModel> showHistory;

  DashboardCompletedState(this.myProfile, this.myStats, this.showHistory);

  @override
  List<Object> get props => [myProfile, myStats, showHistory];
}

class DashboardErrorState extends DashboardState {
  final dynamic error;

  DashboardErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "DashboardErrorState: $error";
  }
}
