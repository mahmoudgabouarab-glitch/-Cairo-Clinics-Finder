import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view/widgets/add_clinic_body.dart';
import 'package:flutter/material.dart';

class AddClinicView extends StatelessWidget {
  const AddClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Add Clinic"),
      body: AddClinicBody(),
    );
  }
}
