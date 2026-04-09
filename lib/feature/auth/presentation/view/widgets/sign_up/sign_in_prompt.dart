import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/extension.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(color: Colors.grey[500], fontSize: 13.sp),
        ),
        GestureDetector(
          onTap: () {
            context.pushAndRemoveUntil(const SignInView());
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
