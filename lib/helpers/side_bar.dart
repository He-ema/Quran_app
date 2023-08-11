import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubits/theme_cubit/theme_cubit.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
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
