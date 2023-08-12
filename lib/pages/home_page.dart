import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
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
  void initState() async {
    super.initState();
    var box = Hive.box('quran');
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (box.get('token') == null) {
        BlocProvider.of<FirebaseCubit>(context).AddToken();
        box.put('token', 1);
      }
    }
  }

  @override
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
              icon: Icon(FontAwesomeIcons.bookQuran), label: 'تدبر'),
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
