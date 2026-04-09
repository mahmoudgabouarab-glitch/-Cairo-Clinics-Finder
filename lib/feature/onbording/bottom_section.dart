import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              'Your health journey starts here',
              style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
            ),
            spaceH(24),
            _OnboardingCard(
              icon: Icons.login_outlined,
              title: 'Login',
              subtitle: 'Welcome back! Sign in to your account',
              filled: false,
              onTap: () {},
            ),
            spaceH(12),
            _OnboardingCard(
              icon: Icons.person_add_outlined,
              title: 'Create an account',
              subtitle: 'New here? Join and find clinics near you',
              filled: true,
              onTap: () {},
            ),
            const Spacer(),
            Text(
              'Clinics Finder — helping you find the right care, nearby',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
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
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
                  ),
                  spaceH(4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.sp, color: subtitleColor),
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
