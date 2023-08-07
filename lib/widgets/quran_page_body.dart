import 'package:flutter/material.dart';
import 'package:prayer/models/page_model.dart';
import 'package:prayer/widgets/custom_app_bar.dart';
import 'package:prayer/widgets/page_List_view.dart';

// ignore: must_be_immutable
class QuranBageBody extends StatelessWidget {
  QuranBageBody({
    super.key,
    required this.page,
    required this.index,
    required this.onPressed,
  });
  PageModel page;
  final int index;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onPressed: onPressed,
          surahName: page.nameOfSurah,
          Juz: page.juzNumber,
          index: index,
        ),
        Expanded(child: PageListView(page: page.pageData)),
      ],
    );
  }
}
