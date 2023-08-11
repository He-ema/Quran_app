import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:prayer/pages/choose_page.dart';
import 'package:prayer/pages/quran_page.dart';
import 'package:prayer/pages/splash_screen.dart';

import 'cubits/theme_cubit/theme_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Hive.initFlutter();
  await Hive.openBox('quran');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => FirebaseCubit(),
      ),
    ],
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
