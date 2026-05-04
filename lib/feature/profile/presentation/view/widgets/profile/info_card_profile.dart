import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_info_row.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCardProfile extends StatelessWidget {
  final UserModel state;
  const InfoCardProfile({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.profile_personal_info.tr(),
            style: AppTextStyles.f14SemiBoldBlack,
          ),
          spaceH(16),
          CustomInfoRow(
            icon: Icons.person_outline,
            label: LocaleKeys.profile_full_name.tr(),
            value: state.name,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.email_outlined,
            label: LocaleKeys.profile_email.tr(),
            value: state.email,
          ),

          _divider(),
          CustomInfoRow(
            icon: Icons.phone_outlined,
            label: LocaleKeys.profile_phone.tr(),
            value: state.phone,
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 24.h, color: Colors.grey[200]);
}
