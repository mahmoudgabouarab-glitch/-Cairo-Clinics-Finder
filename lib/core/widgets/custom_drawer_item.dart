import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? subtitle;
  final Widget? trailing;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
     this.onTap,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
        size: 22.r,
      ),
      title: Text(title, style: AppTextStyles.f16MediumBlack),
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      horizontalTitleGap: 8.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
