import 'package:flutter/material.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/tree.png'),
        fit: BoxFit.cover,
        // opacity: 0.5,
      )),
      child: const Column(
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
      ),
    );
  }
}
