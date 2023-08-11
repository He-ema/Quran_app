part of 'firebase_cubit.dart';

@immutable
sealed class FirebaseState {}

final class FirebaseInitial extends FirebaseState {}

final class FirebaseLoading extends FirebaseState {}

final class FirebaseFailure extends FirebaseState {}

final class FirebaseSuccess extends FirebaseState {
  List<NotificationModel> notificationList = [];
  FirebaseSuccess({required this.notificationList});
}
