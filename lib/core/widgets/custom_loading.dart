import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading {
  static Widget linearLoading() {
    return Center(
      child: LinearProgressIndicator(
        minHeight: 6.h,
        backgroundColor: Colors.grey.shade200,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColor.primary),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }

  static Widget cupertinoLoading({Color? color}) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? Colors.white,
        radius: 16.r,
      ),
    );
  }
}
