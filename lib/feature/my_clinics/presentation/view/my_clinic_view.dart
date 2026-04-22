import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/my_clinic/my_clinic_body.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/my_clinic_cubit/my_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyClinicsView extends StatelessWidget {
  const MyClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "My Clinics"),
      body: const MyClinicBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push(GoTo.addClinic, extra: context.read<MyClinicCubit>()),
        backgroundColor: AppColor.primary,
        icon: const Icon(Icons.add_business_outlined, color: Colors.white),
        label: Text("Add Clinic", style: AppTextStyles.f14MediumWhite),
      ),
    );
  }
}
