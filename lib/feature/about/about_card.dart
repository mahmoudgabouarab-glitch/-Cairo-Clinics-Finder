import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.about_title.tr(),
            style: AppTextStyles.f14SemiBoldBlack,
          ),
          spaceH(12),
          Text(
            LocaleKeys.about_description.tr(),
            style: AppTextStyles.f13Grey.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
