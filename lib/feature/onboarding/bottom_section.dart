import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: [
            Text(
              LocaleKeys.onboarding_tagline.tr(),
              style: AppTextStyles.f14Grey,
            ),
            spaceH(24),
            _OnboardingCard(
              icon: Icons.login_outlined,
              title: LocaleKeys.onboarding_login_title.tr(),
              subtitle: LocaleKeys.onboarding_login_subtitle.tr(),
              filled: false,
              onTap: () => context.pushReplacement(GoTo.signIn),
            ),
            spaceH(12),
            _OnboardingCard(
              icon: Icons.person_add_outlined,
              title: LocaleKeys.onboarding_signup_title.tr(),
              subtitle: LocaleKeys.onboarding_signup_subtitle.tr(),
              filled: true,
              onTap: () => context.pushReplacement(GoTo.signUp),
            ),
            const Spacer(),
            Text(
              LocaleKeys.onboarding_footer.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.f12Grey,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool filled;
  final VoidCallback onTap;

  const _OnboardingCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = filled ? AppColor.primary : AppColor.cardBg;
    final iconBg = filled ? Colors.white24 : const Color(0xFFe0f2f1);
    final titleColor = filled ? Colors.white : AppColor.primary;
    final subtitleColor = filled ? Colors.white70 : Colors.grey[600]!;
    final iconColor = filled ? Colors.white : AppColor.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: AppColor.primary, width: 1.5),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.r,
              height: 48.r,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: 24.r),
              ),
            ),
            spaceW(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.f15MediumBlack.copyWith(
                      color: titleColor,
                    ),
                  ),
                  spaceH(4),
                  Text(
                    subtitle,
                    style: AppTextStyles.f12Black.copyWith(
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: titleColor, size: 20.r),
          ],
        ),
      ),
    );
  }
}
