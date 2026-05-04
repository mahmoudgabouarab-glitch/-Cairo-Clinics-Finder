import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? subtitle;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
     this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 22.r),
      title: Text(title, style: AppTextStyles.f16MediumBlack),
      subtitle: subtitle,
      onTap: onTap,
      horizontalTitleGap: 8.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
