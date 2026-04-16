import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';

class AppTextStyles {
  static TextStyle _t(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = Colors.black,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static final f10Black = _t(10, color: Colors.black);

  static final f12Black = _t(12, color: Colors.black);

  static final f12MediumBlack = _t(
    12,
    weight: FontWeight.w500,
    color: Colors.black87,
  );

  static final f12BoldBlack = _t(
    12,
    weight: FontWeight.w600,
    color: Colors.black87,
  );

  static final f13MediumBlack = _t(
    13,
    weight: FontWeight.w500,
    color: Colors.black87,
  );

  static final f13BoldBlack = _t(
    13,
    weight: FontWeight.w600,
    color: Colors.black87,
  );

  static final f14MediumBlack = _t(
    14,
    weight: FontWeight.w500,
    color: Colors.black87,
  );

  static final f14SemiBoldBlack = _t(
    14,
    weight: FontWeight.w600,
    color: Colors.black87,
  );

  static final f15MediumBlack = _t(
    15,
    weight: FontWeight.w500,
    color: Colors.black87,
  );

  static final f15SemiBoldBlack = _t(
    15,
    weight: FontWeight.w600,
    color: Colors.black87,
  );

  static final f16MediumBlack = _t(
    16,
    weight: FontWeight.w500,
    color: Colors.black87,
  );
  static final f18boldBlack = _t(
    18,
    weight: FontWeight.w700,
    color: Colors.black,
  );

  static final f24BoldBlack = _t(
    24,
    weight: FontWeight.w700,
    color: Colors.black87,
  );

  static final f26BoldBlack = _t(
    26,
    weight: FontWeight.w700,
    color: Colors.black,
  );

  static final f12BoldWhite = _t(
    12,
    weight: FontWeight.bold,
    color: Colors.white,
  );

  static final f14MediumWhite = _t(
    14,
    weight: FontWeight.w500,
    color: Colors.white,
  );

  static final f15SemiBoldWhite = _t(
    15,
    weight: FontWeight.w600,
    color: Colors.white,
  );

  static final f16SemiBoldWhite = _t(
    16,
    weight: FontWeight.w600,
    color: Colors.white,
  );

  static final f20BoldWhite = _t(
    20,
    weight: FontWeight.w700,
    color: Colors.white,
  );

  static final f11Grey = _t(11, color: Colors.grey[500]!);

  static final f12Grey = _t(12, color: Colors.grey[500]!);

  static final f12MediumGrey = _t(
    12,
    weight: FontWeight.w500,
    color: Colors.grey,
  );

  static final f13Grey = _t(13, color: Colors.grey[500]!);

  static final f14Grey = _t(14, color: Colors.grey[500]!);

  static final f14MediumGrey = _t(
    14,
    weight: FontWeight.w500,
    color: Colors.grey,
  );

  static final f13BoldPrimary = _t(
    13,
    weight: FontWeight.w600,
    color: AppColor.primary,
  );

  static final f14BoldPrimary = _t(
    14,
    weight: FontWeight.w600,
    color: AppColor.primary,
  );

  static final f15BoldPrimary = _t(
    15,
    weight: FontWeight.w600,
    color: AppColor.primary,
  );

  static final f12BoldGreen = _t(
    12,
    weight: FontWeight.w600,
    color: AppColor.openGreen,
  );

  static final f12BoldRed = _t(
    12,
    weight: FontWeight.w600,
    color: AppColor.clinicRed,
  );

  static final f14HintGrey = _t(14, color: Colors.grey);
}
