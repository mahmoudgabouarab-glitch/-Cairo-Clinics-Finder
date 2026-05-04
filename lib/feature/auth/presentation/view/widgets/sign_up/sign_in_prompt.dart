import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.signup_signin_prompt_text.tr(),
          style: AppTextStyles.f13Grey,
        ),
        GestureDetector(
          onTap: () => context.pushReplacement(GoTo.signIn),
          child: Text(
            LocaleKeys.signup_signin_prompt_action.tr(),
            style: AppTextStyles.f13BoldPrimary,
          ),
        ),
      ],
    );
  }
}
