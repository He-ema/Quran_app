import 'package:prayer/constants.dart';

class NotificationModel {
  final String title;
  final String subTitle;
  final String date;

  NotificationModel(
      {required this.title, required this.subTitle, required this.date});

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
        title: jsonData[kTitle],
        subTitle: jsonData[kSubTitle],
        date: jsonData[kDate]);
  }
}
