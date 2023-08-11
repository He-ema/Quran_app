import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.1)),
      child: ListTile(
        title: Text(
          'Title',
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'note.subTitle',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.black,
              size: 25,
            )),
      ),
    );
  }
}
