import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/header_auth.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_in_prompt.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderAuth(
              title: "Create account",
              subtitle: "Join and find clinics near you",
            ),
            const SignUpFiled(),
            Btn(onPressed: () {}, text: "Create Account"),
            spaceH(24),
            const SignInPrompt(),
          ],
        ),
      ),
    );
  }
}
