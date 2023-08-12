import 'package:flutter/material.dart';

import 'add_note_form.dart';

class bottomSheetBody extends StatelessWidget {
  const bottomSheetBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 32.0,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 32),
      // ignore: prefer_const_constructors
      child: SingleChildScrollView(child: const AddNoteForm()),
    );
  }
}
