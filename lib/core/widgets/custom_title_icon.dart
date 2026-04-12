import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleIcon extends StatelessWidget {
  final IconData icon;
  final double? width;
  final double? height;
  final double? size;
  const CustomTitleIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      height: height ?? 100.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 200, 242, 241),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size ?? 48.sp, color: AppColor.primary),
    );
  }
}
