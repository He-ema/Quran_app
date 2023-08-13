import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:prayer/models/notification_model.dart';
import 'package:prayer/pages/edit_azkar_item.dart';

import '../cubits/theme_cubit/theme_cubit.dart';

class CustomNotificationItem extends StatelessWidget {
  CustomNotificationItem({super.key, required this.item});

  final NotificationModel item;
  bool isConnected = false;
  Future<void> check() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      isConnected = true;
    } else {
      isConnected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    check();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDark = State is ThemeDark ? true : false;
        return GestureDetector(
          onLongPress: () {
            if (isConnected) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return EditAzkarItem(
                  item: item,
                );
              }));
            } else {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                showCloseIcon: true,
                title: 'لا يوجد انترنت ',
                desc: 'تأكد من اتصالك بالانترنت ثم أعد المحاولة',
                btnOkOnPress: () {},
              ).show();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: state is ThemeDark
                  ? Colors.transparent.withOpacity(0.4)
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      textAlign: TextAlign.right,
                      item.subTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (isConnected) {
                              AwesomeDialog(
                                context: context,
                                descTextStyle: const TextStyle(fontSize: 21),
                                titleTextStyle: const TextStyle(fontSize: 21),
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'حذف ',
                                desc: 'هل تريد بالفعل الحذف ',
                                btnCancelText: "إلغاء",
                                btnOkText: 'نعم',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  BlocProvider.of<FirebaseCubit>(context)
                                      .deleteItem(item.addingTime);
                                },
                              ).show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.topSlide,
                                showCloseIcon: true,
                                title: 'لا يوجد انترنت ',
                                desc:
                                    'تأكد من اتصالك بالانترنت ثم أعد المحاولة',
                                btnOkOnPress: () {},
                              ).show();
                            }
                          },
                          icon: const Icon(FontAwesomeIcons.trash)),
                      Text(
                        item.date,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
