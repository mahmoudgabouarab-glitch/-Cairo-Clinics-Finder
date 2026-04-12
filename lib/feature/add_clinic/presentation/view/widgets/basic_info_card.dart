import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Doctor Name",
            prefixIcon: Icons.person_outlined,
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "speciality",
            prefixIcon: Icons.category_outlined,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon: Icon(Icons.expand_more),
              itemBuilder: (context) => [
                'Dentist',
                'Dermatology',
                'Cardiology',
                'Ophthalmology',
                'Orthopedics',
                'Pediatrics',
                'General',
              ].map((e) => PopupMenuItem(value: e, child: Text(e))).toList(),
              onSelected: (value) {},
            ),
          ),
          spaceH(12),
          CustomTextFormFiled(hint: "Phone Number", prefixIcon: Icons.phone),
        ],
      ),
    );
  }
}
