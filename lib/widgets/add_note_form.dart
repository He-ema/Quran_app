import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  bool checkBoxValue = false;
  bool isConnected = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FirebaseCubit>(context).getTokens();
  }

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
    var tokensList = BlocProvider.of<FirebaseCubit>(context).tokensList;
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(children: [
        CustomTextField(
          onSaved: (value) {
            title = value;
          },
          hint: 'العنوان',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          onSaved: (value) {
            subTitle = value;
          },
          hint: 'المحتوي',
          maxLines: 5,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('اشعار فقط '),
            Checkbox(
                value: checkBoxValue,
                onChanged: (isChecked) {
                  checkBoxValue = isChecked!;
                  setState(() {});
                }),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        CustomButton(
          isLoading: false,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if (isConnected) {
                if (checkBoxValue) {
                  BlocProvider.of<FirebaseCubit>(context)
                      .sendNotification(title!, subTitle!, tokensList);
                } else {
                  BlocProvider.of<FirebaseCubit>(context)
                      .AddNotification(title: title!, subtitle: subTitle!);
                  BlocProvider.of<FirebaseCubit>(context)
                      .sendNotification(title!, subTitle!, tokensList);
                }

                Navigator.pop(context);
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  title: 'لا يجود انترنت ',
                  desc: 'تأكد من اتصالك بالانترنت ثم أعد المحاولة',
                  btnOkOnPress: () {},
                ).show();
              }
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
      ]),
    );
  }
}
