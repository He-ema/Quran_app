import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer/helpers/quran_side_bar.dart';
import 'package:prayer/helpers/show_snack_bar.dart';
import 'package:prayer/pages/choose_page.dart';

import 'package:prayer/widgets/quran_page_body.dart';

import '../helpers/get_surah_info.dart';
import '../models/page_model.dart';
import 'choose_surah.dart';

class QuranPage extends StatefulWidget {
  QuranPage({super.key});
  static String id = 'QuranPage';
  int currentIndex = 0;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  void initState() {
    var box = Hive.box('quran');
    box.get('currentPage') == null
        ? widget.currentIndex = 0
        : widget.currentIndex = box.get('currentPage');

    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool fromSettings = false;
  int snackParPage = 0;
  @override
  PageModel page = GetSurahInfo().getPage(1);
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(initialPage: widget.currentIndex);
    return Scaffold(
      key: _key,
      drawer: QuranSideBar(
        onTap: () {
          fromSettings = true;
          Navigator.pop(context);
          var box = Hive.box('quran');

          box.get('mark') == null
              ? showSnackBar(context, 'أنت لم تقم بوضع اي علامات حتي الان')
              : _pageController.jumpToPage(box.get('mark'));
        },
        goToPageOnTap: () {
          fromSettings = true;
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ChoosePage(
              onTap: (index) {
                Navigator.pop(context);
                _pageController.jumpToPage(index);
              },
            );
          }));
        },
        goToSurahOnTap: () {
          fromSettings = true;
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ChooseSurah(
              onTap: (index) {
                Navigator.pop(context);
                _pageController.jumpToPage(index);
              },
            );
          }));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (int) {
                  if (!fromSettings) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    showSnackBar(context, 'صفحة  ${snackParPage + 1}');
                  } else {
                    fromSettings = false;
                  }
                },
                reverse: true,
                controller: _pageController,
                itemCount: 604,
                itemBuilder: (context, index) {
                  snackParPage = index;
                  var box = Hive.box('quran');
                  box.put('currentPage', index);
                  page = GetSurahInfo().getPage(index + 1);
                  return QuranBageBody(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    page: page,
                    index: index,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
