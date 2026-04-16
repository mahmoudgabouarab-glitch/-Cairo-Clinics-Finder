import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_info_row.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCardProfile extends StatelessWidget {
  final ProfileModel state;
  const InfoCardProfile({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Info',
            style: AppTextStyles.f14SemiBoldBlack,
          ),
          spaceH(16),
          CustomInfoRow(
            icon: Icons.person_outline,
            label: 'Full name',
            value: state.name,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: state.email,
          ),

          _divider(),
          CustomInfoRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: state.phone,
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 24.h, color: Colors.grey[200]);
}
