import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(children: [
        CustomTextField(
          onSaved: (value) {
            title = value;
          },
          hint: 'Title',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          onSaved: (value) {
            subTitle = value;
          },
          hint: 'content',
          maxLines: 5,
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 64,
        ),
        CustomButton(
          isLoading: false,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<FirebaseCubit>(context)
                  .AddNotification(title: title!, subtitle: subTitle!);
              Navigator.pop(context);
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
