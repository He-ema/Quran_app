import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubits/theme_cubit/theme_cubit.dart';

class QuranSideBar extends StatefulWidget {
  const QuranSideBar(
      {super.key,
      required this.onTap,
      required this.goToPageOnTap,
      required this.goToSurahOnTap});
  final void Function()? goToPageOnTap;
  final void Function()? onTap;
  final void Function()? goToSurahOnTap;
  @override
  State<QuranSideBar> createState() => _QuranSideBarState();
}

class _QuranSideBarState extends State<QuranSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 21),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark,
              color: Colors.purple,
              size: 30,
            ),
            title: const Text(
              'Go to Mark ',
              style: TextStyle(fontSize: 16),
            ),
            onTap: widget.onTap,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.fileLines),
            title: const Text('Go to page'),
            onTap: widget.goToPageOnTap,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.bookQuran),
            title: const Text('Go to Surah'),
            onTap: widget.goToSurahOnTap,
          ),
          ListTile(
            leading: BlocProvider.of<ThemeCubit>(context).darkTheme
                ? const Icon(FontAwesomeIcons.moon)
                : const Icon(Icons.sunny),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: DayNightSwitcher(
                isDarkModeEnabled:
                    BlocProvider.of<ThemeCubit>(context).darkTheme,
                onStateChanged: (isDarkModeEnabled) {
                  setState(() {
                    bool current =
                        BlocProvider.of<ThemeCubit>(context).darkTheme;
                    BlocProvider.of<ThemeCubit>(context).setTheme(!current);
                  });
                },
              ),
            ),
            title: const Text('Mode'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
