import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view/widgets/add_clinic_listener.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view/widgets/basic_info_card.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view/widgets/location_card.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view/widgets/working_hours_card.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view_model/cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClinicBody extends StatelessWidget {
  const AddClinicBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClinicCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('Basic Info'),
            spaceH(12),
            const BasicInfoCard(),
            spaceH(16),
            const _SectionTitle('Location'),
            spaceH(12),
            const LocationCard(),
            spaceH(16),
            const _SectionTitle('Working Hours'),
            spaceH(12),
            const WorkingHoursCard(),
            spaceH(32),
            Btn(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.addClinic();
                }
              },
              text: "Submit for review",
            ),
            spaceH(24),
            const AddClinicListener(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.f14SemiBoldBlack,
    );
  }
}
