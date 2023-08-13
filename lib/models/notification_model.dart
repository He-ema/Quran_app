import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayer/constants.dart';

class NotificationModel {
  final String title;
  final String subTitle;
  final String date;
  final Timestamp addingTime;

  NotificationModel(
      {required this.addingTime,
      required this.title,
      required this.subTitle,
      required this.date});

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      addingTime: jsonData[kAddingDate],
      title: jsonData[kTitle],
      subTitle: jsonData[kSubTitle],
      date: jsonData[kDate],
    );
  }
}
