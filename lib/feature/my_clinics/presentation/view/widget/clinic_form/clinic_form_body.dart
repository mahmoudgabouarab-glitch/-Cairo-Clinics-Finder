import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/clinic_form_image_card.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/clinic_form_listener.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/basic_info_card.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/booking_info_card.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/location_card.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/working_hours_card.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicFormBody extends StatelessWidget {
  const ClinicFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    final isEdit = cubit.mode == Request.edit;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClinicFormImageCard(),
            spaceH(12),
            _SectionTitle(LocaleKeys.clinic_form_basic_info.tr()),
            spaceH(12),
            const BasicInfoCard(),
            spaceH(16),
            if (!isEdit) ...[
              _SectionTitle(LocaleKeys.clinic_form_location.tr()),
              spaceH(12),
              const LocationCard(),
              spaceH(16),
            ],
            _SectionTitle(LocaleKeys.clinic_form_working_hours.tr()),
            spaceH(12),
            const WorkingHoursCard(),
            spaceH(16),
            _SectionTitle(LocaleKeys.clinic_form_booking_info.tr()),
            spaceH(12),
            const BookingInfoCard(),
            spaceH(24),
            Btn(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.submit();
                }
              },
              text: isEdit
                  ? LocaleKeys.clinic_form_update.tr()
                  : LocaleKeys.clinic_form_submit.tr(),
            ),
            spaceH(24),
            const ClinicFormListener(),
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
    return Text(title, style: AppTextStyles.f14SemiBoldBlack);
  }
}
