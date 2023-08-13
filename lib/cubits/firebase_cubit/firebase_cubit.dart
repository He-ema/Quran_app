import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:prayer/constants.dart';
import 'package:prayer/models/notification_model.dart';
import 'package:http/http.dart' as http;
part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());
  List<NotificationModel> notificationList = [];
  List<String> tokensList = [];
  CollectionReference azkar =
      FirebaseFirestore.instance.collection(kAzkarCollection);
  CollectionReference tokens =
      FirebaseFirestore.instance.collection(kTokenCollection);
  void AddNotification({required String title, required String subtitle}) {
    azkar.add({
      kTitle: title,
      kSubTitle: subtitle,
      kDate:
          '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().day.toString()} At ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
      kAddingDate: DateTime.now()
    });
  }

  void getItems() {
    azkar.orderBy(kAddingDate, descending: true).snapshots().listen((event) {
      notificationList.clear();
      for (var doc in event.docs) {
        notificationList.add(NotificationModel.fromJson(doc));
      }
      emit(FirebaseSuccess(notificationList: notificationList));
    });
  }

  void sendNotification(String title, String body, List tokens) async {
    for (int i = 0; i < tokens.length; i++) {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$kServerToken',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': tokens[i],
          },
        ),
      );
    }
  }

  void AddToken() async {
    tokens.add({
      kToken: await FirebaseMessaging.instance.getToken(),
    });
  }

  void getTokens() {
    tokens.snapshots().listen((event) {
      tokensList.clear();
      for (var doc in event.docs) {
        tokensList.add(doc[kToken]);
      }
      emit(FirebaseSuccess(notificationList: notificationList));
    });
  }

  void deleteItem(Timestamp date) {
    azkar.snapshots().listen((event) {
      for (var doc in event.docs) {
        if (doc[kAddingDate] == date) {
          azkar.doc(doc.id).delete();
        }
      }
    });
  }

  void updateItem(String title, String body, Timestamp date) {
    azkar.snapshots().listen((event) {
      for (var doc in event.docs) {
        if (doc[kAddingDate] == date) {
          azkar.doc(doc.id).update({
            kTitle: title,
            kSubTitle: body,
          });
        }
      }
    });
  }
}
