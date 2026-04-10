import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthIcon extends StatelessWidget {
  final IconData icon;
  const AuthIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 200, 242, 241),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 48.sp, color: AppColor.primary),
    );
  }
}
