import 'package:flutter/material.dart';

import '../widgets/azkar_elsabah_maktobah.dart';
import '../widgets/azkar_page_body.dart';

class AzkarElsabah extends StatelessWidget {
  const AzkarElsabah({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AzkarBageBody(azkaarText: AzkaarSabah()),
    );
  }
}
