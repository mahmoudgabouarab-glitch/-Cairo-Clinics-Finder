
import 'package:cairo_clinics_finder/core/utils/app_assets.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppBar extends StatelessWidget {
  const AboutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.detailsAppBar,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spaceH(40),
              Image.asset(AppAssets.appLogo, height: 72.h),
              spaceH(8),
              Text(
                'Clinics Finder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
