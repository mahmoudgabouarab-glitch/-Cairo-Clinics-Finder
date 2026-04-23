import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/add_clinic/add_clinic_body.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/add_clinic_cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClinicView extends StatelessWidget {
  const AddClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = context.read<AddClinicCubit>().mode == Request.edit;

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? "Edit Clinic" : "Add Clinic"),
      body: const AddClinicBody(),
    );
  }
}
