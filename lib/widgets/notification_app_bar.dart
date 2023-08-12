import 'package:flutter/material.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "تذكيرات",
          style: TextStyle(fontSize: 21),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
