import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/cubits/cubit/theme_cubit.dart';

class AzkarBageBody extends StatelessWidget {
  const AzkarBageBody({super.key, required this.azkaarText});

  final Widget azkaarText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeDark) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/maxresdefault.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                azkaarText,
              ],
            );
          } else {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/sky.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                azkaarText,
              ],
            );
          }
        },
      ),
    );
  }
}
