import 'package:cairo_clinics_finder/core/utils/app_assets.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppBar extends StatelessWidget {
  const AboutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(gradient: AppColor.detailsAppBar),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spaceH(40),
              Image.asset(AppAssets.appLogo, height: 72.h),
              spaceH(8),
              Text(
                LocaleKeys.about_app_name.tr(),
                style: AppTextStyles.f20BoldWhite,
              ),
              Text(
                LocaleKeys.about_version.tr(),
                style: AppTextStyles.f12Grey.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
