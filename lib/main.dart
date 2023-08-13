import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:prayer/pages/choose_page.dart';
import 'package:prayer/pages/edit_azkar_item.dart';
import 'package:prayer/pages/quran_page.dart';
import 'package:prayer/pages/splash_screen.dart';

import 'cubits/theme_cubit/theme_cubit.dart';
import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  String? title = message.notification!.title;
  String? body = message.notification!.body;
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 123,
    channelKey: 'firebase_channel',
    color: Colors.green,
    title: title,
    body: body,
    category: NotificationCategory.Message,
    wakeUpScreen: true,
    fullScreenIntent: true,
    autoDismissible: true,
    backgroundColor: Colors.orange,
  ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Hive.initFlutter();
  await Hive.openBox('quran');

  AwesomeNotifications().initialize("resource://drawable/notification_icon", [
    NotificationChannel(
      channelKey: 'firebase_channel',
      channelName: 'firebase channel',
      channelDescription: 'firebase notification channel',
      defaultColor: Colors.redAccent,
      ledColor: Colors.white,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      locked: true,
      defaultRingtoneType: DefaultRingtoneType.Notification,
    )
  ]);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

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
