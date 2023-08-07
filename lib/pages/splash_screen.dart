import 'package:animated_text_kit/animated_text_kit.dart';
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
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('كَانَ خُلُقُ نَبِيِّ اللَّه ﷺ الْقُرْآنَ',
                textStyle: const TextStyle(fontSize: 30)),
          ],
          pause: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
