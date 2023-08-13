import 'package:flutter/material.dart';

class CustomEditAppBar extends StatelessWidget {
  const CustomEditAppBar({super.key, required this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تعديل التذكيرات',
                    style: TextStyle(fontSize: 21),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
