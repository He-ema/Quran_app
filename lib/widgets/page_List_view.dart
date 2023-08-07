import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

class PageListView extends StatelessWidget {
  PageListView({super.key, required this.page});

  List<String> page = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: page.length,
        itemBuilder: (context, index) {
          return Text(
            page[index],
            style: page[index].contains('سورة')
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  )
                : page[index].contains(basmala)
                    ? const TextStyle(
                        fontSize: 21,
                      )
                    : const TextStyle(
                        fontSize: 21,
                      ),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
