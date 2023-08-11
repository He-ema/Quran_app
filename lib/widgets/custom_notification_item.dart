import 'package:flutter/material.dart';
import 'package:prayer/models/notification_model.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({super.key, required this.item});

  final NotificationModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                item.subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${item.date}',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
