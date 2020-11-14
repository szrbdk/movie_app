import 'package:flutter/material.dart';
import 'package:progress_follower/utils/app_models/time_model.dart';
import 'package:progress_follower/utils/helpers/helper.dart';

class WidgetHelper {
  static String generateStatTimeText({BuildContext context, int minutes}) {
    List<String> items =
        generateStatTimeTextList(context: context, minutes: minutes);
    return items.join(", ");
  }

  static List<String> generateStatTimeTextList(
      {BuildContext context, int minutes}) {
    TimeModel time = Helper.statTime(minutes: minutes);
    List<String> items = [];
    if (time.year > 0) items.add("${time.year} Years");
    if (time.day > 0) items.add("${time.day} Days");
    if (time.hour > 0) items.add("${time.hour} Hours");
    items.add("${time.minute} Minutes");
    return items;
  }
}
