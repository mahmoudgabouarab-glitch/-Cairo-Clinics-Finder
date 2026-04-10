
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifiedSubtitle extends StatelessWidget {
  final String email;
  const VerifiedSubtitle({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 14.sp, color: Colors.grey[500], height: 1.6),
        children: [
          const TextSpan(text: "We've sent a verification link to\n"),
          TextSpan(
            text: email,
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: "\nPlease verify your email to continue."),
        ],
      ),
    );
  }
}
