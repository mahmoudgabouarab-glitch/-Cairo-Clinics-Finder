import 'package:cairo_clinics_finder/core/utils/app_assets.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColor.onBoardingBar),
      padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 32.w),
      child: Column(
        children: [
          Image.asset(AppAssets.onBoarding, height: 80.h, color: Colors.white54),
          spaceH(16),
          Text(
            LocaleKeys.onboarding_welcome.tr(),
            style: AppTextStyles.f14SemiBoldBlack.copyWith(letterSpacing: 0.5),
          ),
          spaceH(4),
          Text(
            LocaleKeys.onboarding_app_name.tr(),
            style: AppTextStyles.f26BoldBlack.copyWith(letterSpacing: 1.5),
          ),
        ],
      ),
    );
  }
}
