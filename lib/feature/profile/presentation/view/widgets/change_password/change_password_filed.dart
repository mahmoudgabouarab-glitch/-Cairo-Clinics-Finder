import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordFiled extends StatelessWidget {
  const ChangePasswordFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          spaceH(16),
          CustomTextFormFiled(
            hint: "Current Password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "New Password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "Confirm Password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
        ],
      ),
    );
  }
}

Widget _title() {
  return Text(
    'Update your password',
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
  );
}
