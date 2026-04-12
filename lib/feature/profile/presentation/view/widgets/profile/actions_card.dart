import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ActionsCard extends StatelessWidget {
  final ProfileModel profileModel;
  const ActionsCard({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          spaceH(8),
          _ActionRow(
            icon: Icons.edit_outlined,
            title: 'Edit Profile',
            onTap: () => context.push(
              GoTo.editProfile,
              extra: {
                'profile': profileModel,
                'cubit': context.read<ProfileCubit>(),
              },
            ),
          ),
          _ActionRow(
            icon: Icons.lock_outline,
            title: 'Change Password',
            onTap: () {},
          ),
          _ActionRow(
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

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ActionRow({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppColor.clinicRed : Colors.black87;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color, size: 20.r),
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp, color: color),
      ),
      trailing: isDestructive
          ? null
          : Icon(Icons.chevron_right, color: Colors.grey[400], size: 20.r),
      onTap: onTap,
    );
  }
}
