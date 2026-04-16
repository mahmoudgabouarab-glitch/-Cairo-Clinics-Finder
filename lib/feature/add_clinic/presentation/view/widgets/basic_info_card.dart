import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view_model/cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClinicCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Doctor Name",
            prefixIcon: Icons.person_outlined,
            controller: cubit.doctorNameController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "speciality",
            prefixIcon: Icons.category_outlined,
            controller: cubit.selectedCategory,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon:const Icon(Icons.expand_more),
              itemBuilder: (context) => _categories
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e.replaceAll(e[0], e[0].toUpperCase())),
                    ),
                  )
                  .toList(),
              onSelected: (value) => cubit.selectedCategory.text = value,
            ),
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "Phone Number",
            prefixIcon: Icons.phone,
            controller: cubit.phoneController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

List<String> _categories = [
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
