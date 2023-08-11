import 'package:flutter/material.dart';

import '../widgets/bottom_sheet_body.dart';
import '../widgets/custom_notification_item.dart';
import '../widgets/notification_app_bar.dart';

// ignore: camel_case_types
class TasbeehPage extends StatelessWidget {
  const TasbeehPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return bottomSheetBody();
              },
            );
          }),
      body: Column(
        children: [
          NotificationAppBar(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => CustomNotificationItem(),
            ),
          ),
        ],
      ),
    );
  }
}
