import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:progress_follower/helpers/api_helper.dart';
import 'package:progress_follower/model/user_settings/user_settings.dart';
import 'package:progress_follower/model/user_stats/user_stats.dart';
import 'package:progress_follower/ui/dashboard/model/last_watched_show_model.dart';
import 'package:progress_follower/utils/helpers/widget_helper.dart';

class DashboardPage extends StatelessWidget {
  final UserSettings myProfile;
  final UserStats myStats;
  final List<LastWatchedShowModel> showHistory;
  DashboardPage({
    @required this.myProfile,
    @required this.myStats,
    @required this.showHistory,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileHeader(width, context),
          statSlider(context) ?? Text("No Stats"),
          lastActivitiesWidget(context) ?? Text("No Activity"),
        ],
      ),
    );
  }

  Container profileHeader(double width, BuildContext context) {
    return Container(
      width: width,
      height: width * 0.5,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            profileImageWidget(width),
            profileInfoWidget(context)
          ],
        ),
      ),
    );
  }

  Expanded profileInfoWidget(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "${myProfile.user.name}",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            "${myProfile.user.location}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "${myProfile.user.gender.toUpperCase()}, ${myProfile.user.age}",
            style: TextStyle(fontSize: 20),
          ),
          // Text(
          //     "${DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(myProfile.user.joinedAt)}"),
        ],
      ),
    );
  }

  CachedNetworkImage profileImageWidget(double width) {
    return CachedNetworkImage(
      imageUrl: myProfile.user.images.avatar.full,
      height: (width * 0.5) - 30,
    );
  }

  Widget statSlider(BuildContext context) {
    List<Widget> widgets = statWidgetItemBuilder(context);
    return widgets.isEmpty
        ? null
        : CarouselSlider(
            options: CarouselOptions(height: 100, viewportFraction: 0.95),
            items: widgets.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return i;
                  },
                );
              },
            ).toList(),
          );
  }

  List<Widget> statWidgetItemBuilder(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Movie"),
                Text(
                    "${myStats.movies.watched ?? 0} movie, ${myStats.movies.plays ?? 0} plays"),
                Text("Watched ${WidgetHelper.generateStatTimeText(context: context, minutes: myStats.movies.minutes ?? 0)}"),
              ],
            ),
          ),
        ],
      ),
    ));
    widgets.add(Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Show"),
                Text(
                    "${myStats.episodes.watched ?? 0} episode, ${myStats.episodes.plays ?? 0} plays"),
                Text("${myStats.shows.watched} show"),
                Text("Watched ${WidgetHelper.generateStatTimeText(context: context, minutes: myStats.episodes.minutes ?? 0)}"),
              ],
            ),
          ),
        ],
      ),
    ));
    return widgets;
  }

  Widget lastActivitiesWidget(BuildContext context) {
    List<Widget> widgets = lastActivitiesWidgetItemBuilder(context);
    return widgets.isEmpty
        ? null
        : Container(
            height: MediaQuery.of(context).size.width * 0.33 * 1.5 + 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widgets.length,
              itemBuilder: (context, index) {
                return widgets[index];
              },
            ),
          );
  }

  List<Widget> lastActivitiesWidgetItemBuilder(BuildContext context) {
    var widgets = <Widget>[];
    showHistory.forEach(
      (lastWatched) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                lastWatched.poster == null
                    ? Container()
                    : CachedNetworkImage(
                        imageUrl:
                            "${ApiHelper.tmdbImageUrl(lastWatched.poster)}",
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.width * 0.33 * 1.5,
                        fit: BoxFit.fill,
                      ),
                Text(
                  "${lastWatched.title}",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${lastWatched.nextEpisode.title}",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${lastWatched.nextEpisode.season}/${lastWatched.nextEpisode.number}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
    return widgets;
  }
}
