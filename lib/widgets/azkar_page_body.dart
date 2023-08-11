import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/theme_cubit/theme_cubit.dart';

class AzkarBageBody extends StatelessWidget {
  const AzkarBageBody({super.key, required this.azkaarText});

  final Widget azkaarText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    state is ThemeDark
                        ? 'assets/images/night.jpg'
                        : 'assets/images/day.jpg',
                  )),
            ),
            child: azkaarText),
      );
    });
  }
}
