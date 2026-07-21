import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';

class AppTextStyles {
  static TextStyle _t(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: size.sp,
      fontWeight: weight,
      // When null the text inherits the theme's text color (adapts to dark mode).
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // "Black" styles carry no color so they follow the active theme.
  static final f10Black = _t(10);

  static final f12Black = _t(12);

  static final f12MediumBlack = _t(12, weight: FontWeight.w500);

  static final f12BoldBlack = _t(12, weight: FontWeight.w600);

  static final f13MediumBlack = _t(13, weight: FontWeight.w500);

  static final f14MediumBlack = _t(14, weight: FontWeight.w500);

  static final f14SemiBoldBlack = _t(14, weight: FontWeight.w600);

  static final f15MediumBlack = _t(15, weight: FontWeight.w500);

  static final f16MediumBlack = _t(16, weight: FontWeight.w500);

  static final f18boldBlack = _t(18, weight: FontWeight.w700);

  static final f24BoldBlack = _t(24, weight: FontWeight.w700);

  static final f26BoldBlack = _t(26, weight: FontWeight.w700);

  static final f14MediumWhite = _t(
    14,
    weight: FontWeight.w500,
    color: AppColor.textOnPrimary,
  );

  static final f15SemiBoldWhite = _t(
    15,
    weight: FontWeight.w600,
    color: AppColor.textOnPrimary,
  );

  static final f16SemiBoldWhite = _t(
    16,
    weight: FontWeight.w600,
    color: AppColor.textOnPrimary,
  );

  static final f20BoldWhite = _t(
    20,
    weight: FontWeight.w700,
    color: AppColor.textOnPrimary,
  );

  static final f11Grey = _t(11, color: AppColor.textSecondary);

  static final f12Grey = _t(12, color: AppColor.textSecondary);

  static final f13Grey = _t(13, color: AppColor.textSecondary);

  static final f14Grey = _t(14, color: AppColor.textSecondary);

  static final f13BoldPrimary = _t(
    13,
    weight: FontWeight.w600,
    color: AppColor.textAccent,
  );

  static final f14BoldPrimary = _t(
    14,
    weight: FontWeight.w600,
    color: AppColor.textAccent,
  );

  static final f15BoldPrimary = _t(
    15,
    weight: FontWeight.w600,
    color: AppColor.textAccent,
  );
}
