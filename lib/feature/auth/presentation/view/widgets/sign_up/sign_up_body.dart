import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/header_auth.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_in_prompt.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_action.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_listener.dart';
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
            const SignUpAction(),
            spaceH(24),
            const SignInPrompt(),
            const SignUpListener(),
          ],
        ),
      ),
    );
  }
}
