import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:prayer/cubits/theme_cubit/theme_cubit.dart';
import 'package:prayer/widgets/custom_button.dart';

import '../models/notification_model.dart';
import '../widgets/custom_edit_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class EditAzkarItem extends StatefulWidget {
  EditAzkarItem({super.key, required this.item});

  final NotificationModel item;
  static String id = 'EditItem';

  @override
  State<EditAzkarItem> createState() => _EditAzkarItemState();
}

class _EditAzkarItemState extends State<EditAzkarItem> {
  String? title, subTitle;

  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.item.title;
    _controller2.text = widget.item.subTitle;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  CustomEditAppBar(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          autovalidateMode: autovalidateMode,
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _controller,
                                onSaved: (value) {
                                  title = value;
                                },
                                hint: 'العنوان',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextField(
                                controller: _controller2,
                                onSaved: (value) {
                                  subTitle = value;
                                },
                                hint: 'المحتوي',
                                maxLines: 5,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    BlocProvider.of<FirebaseCubit>(context)
                                        .updateItem(
                                            _controller.text,
                                            _controller2.text,
                                            widget.item.addingTime);
                                    Navigator.pop(context);
                                  } else {
                                    autovalidateMode = AutovalidateMode.always;
                                    setState(() {});
                                  }
                                },
                                text: 'حفظ',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
