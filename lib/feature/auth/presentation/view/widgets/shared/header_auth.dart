import 'package:cairo_clinics_finder/core/utils/app_assets.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAuth extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderAuth({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColor.onBoardingBar),
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.onBoarding, height: 80.h, color: Colors.white54),
          spaceH(16),
          Text(
            title,
            style: AppTextStyles.f26BoldBlack.copyWith(letterSpacing: 1.5),
          ),
          spaceH(4),
          Text(
            subtitle,
            style: AppTextStyles.f14SemiBoldBlack.copyWith(letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}
