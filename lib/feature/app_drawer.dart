import 'package:cairo_clinics_finder/core/widgets/custom_drawer_item.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/profile_builed.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF0F4F8),
      child: Column(
        children: [
          const ProfileBuiled(),
          DrawerItem(
            icon: Icons.add_business_outlined,
            title: 'Add Clinic',
            onTap: () {},
          ),
          DrawerItem(
            icon: Icons.favorite_outline,
            title: 'Saved Clinics',
            onTap: () {},
          ),
          DrawerItem(icon: Icons.info_outline, title: 'About', onTap: () {}),
          DrawerItem(
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

