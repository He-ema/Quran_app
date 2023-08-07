import 'package:flutter/material.dart';

import '../widgets/azkar_elmasaa_maktobah.dart';
import '../widgets/azkar_page_body.dart';

class AzkarElmasaa extends StatelessWidget {
  const AzkarElmasaa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AzkarBageBody(azkaarText: AzkaarMasaa()),
    );
  }
}
