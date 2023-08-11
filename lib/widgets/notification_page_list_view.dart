import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';

import 'custom_notification_item.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseCubit, FirebaseState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => CustomNotificationItem(),
        );
      },
    );
  }
}
