import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../widgets/choosing_page_items.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key, this.onTap});
  static String id = 'ChoosePage';
  final void Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.75),
        title: const Text('أختر صفحة'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 604,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onTap!(index);
            },
            child: ChoosingPageItem(
              name: getSurahNameArabic(getPageData(index + 1)[0]['surah']),
              page: (index + 1).toString(),
            ),
          );
        },
      ),
    );
  }
}
