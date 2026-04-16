import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About the app', style: AppTextStyles.f14SemiBoldBlack),
          spaceH(12),
          Text(
            'Cairo Clinics Finder helps you find nearby clinics, pharmacies, and medical specialists in Cairo. Browse by category, view details, and get directions — all in one place.',
            style: AppTextStyles.f13Grey.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
