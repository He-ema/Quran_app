import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:prayer/constants.dart';
import 'package:prayer/models/notification_model.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());
  List<NotificationModel> notificationList = [];
  CollectionReference azkar =
      FirebaseFirestore.instance.collection(kAzkarCollection);
  void AddNotification({required String title, required String subtitle}) {
    azkar.add({
      kTitle: title,
      kSubTitle: subtitle,
      kDate: DateTime.now(),
    });
  }

  void getMessages() {
    azkar.orderBy(kDate, descending: true).snapshots().listen((event) {
      notificationList.clear();
      for (var doc in event.docs) {
        notificationList.add(NotificationModel.fromJson(doc));
      }
      emit(FirebaseSuccess(notificationList: notificationList));
    });
  }
}
