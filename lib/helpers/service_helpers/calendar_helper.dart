import 'package:intl/intl.dart';

class CalendarHelper {
  String calendarHelper(String path, DateTime startDate, int days) {
    if (days.isNegative) days = days * (-1);
    if (startDate == null && days == null) {
      return path;
    } else {
      List<String> pathItems = List<String>();
      pathItems.add(path);
      if (startDate != null && days == null) {
        pathItems.add(DateFormat("yyyy-MM-dd").format(startDate));
      } else if (startDate == null && days != null) {
        startDate = DateTime.now().subtract(Duration(days: days));
        pathItems.add(DateFormat("yyyy-MM-dd").format(startDate));
        pathItems.add(days.toString());
      } else {
        pathItems.add(DateFormat("yyyy-MM-dd").format(startDate));
        pathItems.add(days.toString());
      }
      return pathItems.join("/");
    }
  }
}
