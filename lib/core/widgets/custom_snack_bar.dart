import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    Color iconColor;
    IconData iconData;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColor.openGreen;
        iconColor = Colors.white;
        iconData = Icons.check_circle_outline;
        break;
      case SnackBarType.error:
        backgroundColor = AppColor.clinicRed;
        iconColor = Colors.white;
        iconData = Icons.error_outline;
        break;
      case SnackBarType.warning:
        backgroundColor = const Color(0xFFF9A825);
        iconColor = Colors.white;
        iconData = Icons.warning_amber_outlined;
        break;
      default:
        backgroundColor = AppColor.primary;
        iconColor = Colors.white;
        iconData = Icons.info_outline;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          duration: duration,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Row(
            children: [
              Icon(iconData, color: iconColor, size: 20.r),
              spaceW(12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

enum SnackBarType { success, error, warning, info }