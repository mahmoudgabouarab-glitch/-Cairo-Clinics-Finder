import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/header_auth.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_in_prompt.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_action.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_avatar.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/sign_up/sign_up_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(
            title: "Create account",
            subtitle: "Join and find clinics near you",
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
            child: Column(
              children: [
                const SignUpAvatar(),
                const SignUpFiled(),
                const SignUpAction(),
                spaceH(24),
                const SignInPrompt(),
                const SignUpListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
