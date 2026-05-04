import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          TextSpan(text: LocaleKeys.verification_subtitle_prefix.tr()),
          TextSpan(text: email, style: AppTextStyles.f14BoldPrimary),
          TextSpan(text: LocaleKeys.verification_subtitle_suffix.tr()),
        ],
      ),
    );
  }
}
