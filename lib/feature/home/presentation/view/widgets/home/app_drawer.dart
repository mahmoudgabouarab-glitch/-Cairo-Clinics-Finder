import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF0F4F8),
      child: Column(
        children: [
          _DrawerHeader(),
          spaceH(8),
          _DrawerItem(
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () => context.push(GoTo.profile),
          ),
          _DrawerItem(
            icon: Icons.add_business_outlined,
            title: 'Add Clinic',
            onTap: () {},
          ),
          _DrawerItem(
            icon: Icons.favorite_outline,
            title: 'Saved Clinics',
            onTap: () {},
          ),
          _DrawerItem(icon: Icons.info_outline, title: 'About', onTap: () {}),
          _DrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            isDestructive: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: Colors.black12,
            child: Icon(Icons.person, size: 32.r, color: Colors.white),
          ),
          spaceH(12),
          Text(
            'Mahmoud',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'mahmoud@email.com',
            style: TextStyle(color: Colors.black87, fontSize: 13.sp),
          ),
          spaceH(10),
          Divider(color: Colors.blueGrey),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppColor.clinicRed : Colors.black87;

    return ListTile(
      leading: Icon(icon, color: color, size: 22.r),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 8.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
