import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../widgets/choosing_page_items.dart';

class ChooseSurah extends StatelessWidget {
  const ChooseSurah({super.key, this.onTap});
  static String id = 'ChoosePage';
  final void Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.75),
        title: const Text('أختر سورة'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          int surahStartingPage = getPageNumber(index + 1, 1);
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onTap!(surahStartingPage - 1);
            },
            child: ChoosingPageItem(
              name: getSurahNameArabic(index + 1),
              page: surahStartingPage.toString(),
            ),
          );
        },
      ),
    );
  }
}
