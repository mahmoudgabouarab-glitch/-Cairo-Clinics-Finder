import 'package:cairo_clinics_finder/core/utils/app_assets.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColor.onBordingBar),
      padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 32.w),
      child: Column(
        children: [
          Image.asset(AppAssets.onBording, height: 80.h, color: Colors.white54),
          spaceH(16),
          Text(
            'Welcome to',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          spaceH(4),
          Text(
            'Clinics Finder',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
