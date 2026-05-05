import 'package:cairo_clinics_finder/feature/onboarding/bottom_section.dart';
import 'package:cairo_clinics_finder/feature/onboarding/top_section.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [TopSection(), BottomSection()]),
    );
  }
}
