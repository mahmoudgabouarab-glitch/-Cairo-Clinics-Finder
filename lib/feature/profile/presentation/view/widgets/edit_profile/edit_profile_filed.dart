import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileFiled extends StatelessWidget {
  const EditProfileFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Personal Info', isSuperTitle: true),
          spaceH(16),
          _sectionTitle("Name"),
          spaceH(4),
          CustomTextFormFiled(hint: "Name", prefixIcon: Icons.person),
          spaceH(12),
          _sectionTitle("Email"),
          spaceH(4),
          CustomTextFormFiled(hint: "Email", prefixIcon: Icons.email_outlined),
          spaceH(12),
          _sectionTitle("phone"),
          spaceH(4),
          CustomTextFormFiled(hint: "phone", prefixIcon: Icons.phone),
        ],
      ),
    );
  }
}

Widget _sectionTitle(String title, {bool isSuperTitle = false}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: isSuperTitle ? 14.sp : 12.sp,
      fontWeight: isSuperTitle ? FontWeight.w600 : FontWeight.w500,
      color: isSuperTitle ? Colors.black87 : Colors.grey[700],
    ),
  );
}
