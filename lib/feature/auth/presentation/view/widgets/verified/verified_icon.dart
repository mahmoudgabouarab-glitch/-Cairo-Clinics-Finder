
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifiedIcon extends StatelessWidget {
  const VerifiedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 200, 242, 241),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.mark_email_unread_outlined,
        size: 48.sp,
        color: AppColor.primary,
      ),
    );
  }
}
