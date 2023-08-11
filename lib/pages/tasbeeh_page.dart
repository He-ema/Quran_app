import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';

import '../widgets/bottom_sheet_body.dart';
import '../widgets/custom_notification_item.dart';
import '../widgets/notification_app_bar.dart';
import '../widgets/notification_page_list_view.dart';

// ignore: camel_case_types
class TasbeehPage extends StatelessWidget {
  const TasbeehPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return bottomSheetBody();
                },
              );
            }),
        body: Column(
          children: [
            NotificationAppBar(),
            Expanded(child: NotificationListView()),
          ],
        ),
      ),
    );
  }
}
