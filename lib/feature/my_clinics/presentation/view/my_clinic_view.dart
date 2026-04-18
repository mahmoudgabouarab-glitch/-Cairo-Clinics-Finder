import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/my_clinic_body.dart';
import 'package:flutter/material.dart';

class MyClinicsView extends StatelessWidget {
  const MyClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "My Clinics"),
      body: MyClinicBody(),
    );
  }
}
