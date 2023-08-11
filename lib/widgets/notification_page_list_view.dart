import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';

import 'custom_notification_item.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({super.key});

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  @override
  void initState() {
    BlocProvider.of<FirebaseCubit>(context).getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseCubit, FirebaseState>(
      builder: (context, state) {
        var notificationList =
            BlocProvider.of<FirebaseCubit>(context).notificationList;
        return ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) =>
              CustomNotificationItem(item: notificationList[index]),
        );
      },
    );
  }
}
