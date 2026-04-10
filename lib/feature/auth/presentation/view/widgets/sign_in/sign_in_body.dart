import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/header_auth.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_in_action.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/forget_password_btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_in_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_up_listener.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderAuth(title: "Welcome back", subtitle: "Sign in to continue"),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
            child: Column(
              children: [
                const SignInFiled(),
                const ForgetPasswordBtn(),
                spaceH(24),
                const SignInAction(),
                spaceH(24),
                const SignUpPrompt(),
                const SignInListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
