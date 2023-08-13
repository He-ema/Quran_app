import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:prayer/helpers/side_bar.dart';
import 'package:prayer/pages/azkar_elsabah.dart';
import 'package:prayer/pages/azkar_elmasaa.dart';
import 'package:prayer/pages/quran_page.dart';
import 'package:prayer/pages/tasbeeh_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const TasbeehPage(),
    const AzkarElmasaa(),
    const AzkarElsabah(),
    QuranPage(),
  ];

  int selectedpage = 3;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    var box = Hive.box('quran');
    if (box.get('token') == null) {
      check();
    }
  }

  @override
  Future<void> check() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      var box = Hive.box('quran');
      BlocProvider.of<FirebaseCubit>(context).AddToken();
      box.put('token', 1);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: selectedpage == 3
          ? null
          : FloatingActionButton.small(
              child: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
      drawer: selectedpage == 3 ? null : const SideBar(),
      body: pages.elementAt(selectedpage),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedpage = value;
          setState(() {});
        },
        currentIndex: selectedpage,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xffF5F3F4),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'تذكيرات'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.moon), label: 'أذكار المساء'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sunny), label: 'أذكار الصباح'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bookQuran), label: 'القرآن الكريم'),
        ],
      ),
    );
  }
}
