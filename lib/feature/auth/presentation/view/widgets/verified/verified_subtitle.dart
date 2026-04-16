import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class VerifiedSubtitle extends StatelessWidget {
  final String email;
  const VerifiedSubtitle({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.f14Grey.copyWith(height: 1.6),
        children: [
          const TextSpan(text: "We've sent a verification link to\n"),
          TextSpan(text: email, style: AppTextStyles.f14BoldPrimary),
          const TextSpan(text: "\nPlease verify your email to continue."),
        ],
      ),
    );
  }
}
