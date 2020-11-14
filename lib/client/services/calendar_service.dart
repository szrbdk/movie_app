import 'package:progress_follower/client/rest_client.dart';
import 'package:progress_follower/helpers/service_helpers/calendar_helper.dart';
import 'package:progress_follower/model/calendar/calendar.dart';

class CalendarService {
  /// [startDate => 2019-04-01] [days => 7]
  ///
  /// OK --> [startDate == null] && [days == null]
  ///
  /// OK --> [days == null] => [startDate != null]
  ///
  /// IF --> [startDate == null && days != null] ==> [startDate = TODAY - days]
  Future<List<Calendar>> myShows(Map<String, dynamic> parameters,
      {DateTime startDate, int days}) {
    String path = "calendars/my/shows";
    path = CalendarHelper().calendarHelper(path, startDate, days);
    return RestClient().getRequest<List<Calendar>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: true,
      parameters: parameters,
      constructor: (data) {
        List<Calendar> list = List<Calendar>();
        data.forEach((item) => list.add(Calendar.fromJson(item)));
      },
    );
  }

  /// [startDate => 2019-04-01] [days => 7]
  ///
  /// OK --> [startDate == null] && [days == null]
  ///
  /// OK --> [days == null] => [startDate != null]
  ///
  /// IF --> [startDate == null && days != null] ==> [startDate = TODAY - days]
  Future<List<Calendar>> allShows(Map<String, dynamic> parameters,
      {DateTime startDate, int days}) {
    String path = "calendars/all/shows";
    path = CalendarHelper().calendarHelper(path, startDate, days);
    return RestClient().getRequest<List<Calendar>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Calendar> list = List<Calendar>();
        data.forEach((item) => list.add(Calendar.fromJson(item)));
        return list;
      },
    );
  }

  /// [startDate => 2019-04-01] [days => 7]
  ///
  /// OK --> [startDate == null] && [days == null]
  ///
  /// OK --> [days == null] => [startDate != null]
  ///
  /// IF --> [startDate == null && days != null] ==> [startDate = TODAY - days]
  Future<List<Calendar>> allNewShows(Map<String, dynamic> parameters,
      {DateTime startDate, int days}) {
    String path = "calendars/all/shows/new";
    path = CalendarHelper().calendarHelper(path, startDate, days);
    return RestClient().getRequest<List<Calendar>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Calendar> list = List<Calendar>();
        data.forEach((item) => list.add(Calendar.fromJson(item)));
        return list;
      },
    );
  }

  /// [startDate => 2019-04-01] [days => 7]
  ///
  /// OK --> [startDate == null] && [days == null]
  ///
  /// OK --> [days == null] => [startDate != null]
  ///
  /// IF --> [startDate == null && days != null] ==> [startDate = TODAY - days]
  Future<List<Calendar>> allMovies(Map<String, dynamic> parameters,
      {DateTime startDate, int days}) {
    String path = "calendars/all/movies";
    path = CalendarHelper().calendarHelper(path, startDate, days);
    return RestClient().getRequest<List<Calendar>, List<dynamic>>(
      path: path,
      traktRequired: true,
      authRequired: false,
      parameters: parameters,
      constructor: (data) {
        List<Calendar> list = List<Calendar>();
        data.forEach((item) => list.add(Calendar.fromJson(item)));
        return list;
      },
    );
  }
}
