import 'package:flutter/material.dart';
import 'package:progress_follower/model/token/token.dart';
import 'package:progress_follower/utils/app_models/time_model.dart';

class Helper {
  static TimeModel statTime({@required int minutes}) {
    TimeModel _timeModel = TimeModel();

    _timeModel.year = (minutes / (24 * 60 * 365)).floor();
    minutes %= (24 * 60 * 365);

    _timeModel.day = (minutes / (24 * 60)).floor();
    minutes %= (24 * 60);

    _timeModel.hour = (minutes / 60).floor();
    minutes %= 60;

    _timeModel.minute = minutes;
    return _timeModel;
  }

  static bool isTokenRequiresRefresh(Token token) {
    int tokenExpireTime = (token.createdAt + token.expiresIn) * 1000;
    int now = DateTime.now().millisecondsSinceEpoch;
    bool isTokenExpired = now >= tokenExpireTime;
    bool isTokenAboutToExpired = now - tokenExpireTime >= 86400000;
    return isTokenExpired || isTokenAboutToExpired ? true : false;
  }

  static Map<String, dynamic> cleanData(Map<String, dynamic> data) {
    Map<String, dynamic> temp = data;
    temp.removeWhere((key, value) => value == null);
    return temp;
  }
}
