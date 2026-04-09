import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAuth extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderAuth({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceH(48),
        Text(
          title,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        spaceH(8),
        Text(
          subtitle,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
