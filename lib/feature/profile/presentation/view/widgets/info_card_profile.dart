import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCardProfile extends StatelessWidget {
  const InfoCardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Info',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          spaceH(16),
          CustomInfoRow(
            icon: Icons.person_outline,
            label: 'Full name',
            value: 'Mahmoud A. Elsayed',
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'mahmoud@email.com',
          ),

          _divider(),
          CustomInfoRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '01012345678',
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 24.h, color: Colors.grey[200]);
}
