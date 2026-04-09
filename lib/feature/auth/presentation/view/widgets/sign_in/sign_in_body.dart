import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/header_auth.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/forget_password.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_in_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_in/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderAuth(title: "Welcome back", subtitle: "Sign in to continue"),
            const SignInFiled(),
            const ForgetPassword(),
            spaceH(24),
            Btn(onPressed: () {}, text: "Sign In"),
            spaceH(24),
            const SignUpPrompt(),
          ],
        ),
      ),
    );
  }
}
