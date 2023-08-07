import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer/cubits/cubit/theme_cubit.dart';
import 'package:prayer/pages/choose_page.dart';
import 'package:prayer/pages/quran_page.dart';
import 'package:prayer/pages/splash_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Hive.initFlutter();
  await Hive.openBox('quran');
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ThemeDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            routes: {
              QuranPage.id: (context) => QuranPage(),
              Splasher.id: (context) => const Splasher(),
              ChoosePage.id: (context) => const ChoosePage(),
            },
            initialRoute: Splasher.id,
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            routes: {
              QuranPage.id: (context) => QuranPage(),
              Splasher.id: (context) => const Splasher(),
            },
            initialRoute: Splasher.id,
          );
        }
      },
    );
  }
}
