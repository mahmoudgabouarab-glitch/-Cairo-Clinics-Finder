import 'package:cairo_clinics_finder/core/utils/app_validator.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> categories = [
      'dentist',
      'dermatology',
      'ophthalmology',
      'pediatrics',
      'cardiology',
      'orthopedics',
      'neurology',
      'gynecology',
      'urology',
      'ent',
    ];
    const List<String> degrees = [
      "bachelor",
      "master",
      "phd",
      "diploma",
      "specialist",
    ];
    final cubit = context.read<ClinicFormCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_doctor_name.tr(),
            prefixIcon: Icons.person_outlined,
            controller: cubit.doctorNameController,
            validator: AppValidator.nameValidator(),
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_phone.tr(),
            prefixIcon: Icons.phone,
            controller: cubit.phoneController,
            validator: AppValidator.phoneValidator(),
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_speciality.tr(),
            prefixIcon: Icons.category_outlined,
            controller: cubit.categoryController,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon: const Icon(Icons.expand_more),
              itemBuilder: (context) => categories
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text('clinic_form.$e'.tr()),
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                cubit.categoryController.text = 'clinic_form.$value'.tr();
                cubit.selectedCategoryValue = value;
              },
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.clinic_form_speciality_required.tr();
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_degree.tr(),
            prefixIcon: Icons.workspace_premium_outlined,
            controller: cubit.degreeController,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon: const Icon(Icons.expand_more),
              itemBuilder: (context) => degrees
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text('clinic_form.$e'.tr()),
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                cubit.degreeController.text = 'clinic_form.$value'.tr();
                cubit.selectedDegreeValue = value;
              },
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.clinic_form_degree_required.tr();
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
