import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/model/user_stats/user_stats.dart';
import 'package:progress_follower/ui/dashboard/bloc/dashboard_bloc.dart';
import 'package:progress_follower/ui/dashboard/bloc/dashboard_event.dart';
import 'package:progress_follower/ui/dashboard/bloc/dashboard_state.dart';
import 'package:progress_follower/ui/dashboard/model/last_watched_show_model.dart';
import 'package:progress_follower/ui/dashboard/screen/dashboard_page.dart';
import 'package:progress_follower/widget/custom_drawer/custom_drawer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardBloc _bloc = DashboardBloc();

  UserSettings myProfile;
  UserStats myStats;
  List<LastWatchedShowModel> showHistory = [];

  bool profileLoaded = false;

  @override
  void initState() {
    _bloc.add(BeginEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: CustomDrawer(),
        body: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (state is DashboardCompletedState) {
              setState(() {
                showHistory.clear();
                myProfile = state.myProfile;
                myStats = state.myStats;
                showHistory.addAll(state.showHistory);
                profileLoaded = true;
              });
            }
          },
          child: profileLoaded
              ? DashboardPage(
                  myProfile: myProfile,
                  myStats: myStats,
                  showHistory: showHistory,
                )
              : Container(),
        ),
      ),
    );
  }
}
