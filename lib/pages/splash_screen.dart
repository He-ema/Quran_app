import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Splasher extends StatefulWidget {
  const Splasher({super.key});

  static String id = 'splash';
  @override
  State<Splasher> createState() => _SplasherState();
}

class _SplasherState extends State<Splasher> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => const HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/quranKarem.png',
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    );
  }
}
