import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_drawer_item.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileBuiled extends StatelessWidget {
  const ProfileBuiled({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileInitial():
            break;
          case ProfileLoading():
            return Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            );
          case ProfileSuccess():
            return Column(
              children: [
                _DrawerHeader(state: state.profile),
                spaceH(8),
                DrawerItem(
                  icon: Icons.person_outline,
                  title: 'My Profile',
                  onTap: () => context.push(GoTo.profile, extra: state.profile),
                ),
              ],
            );
          case ProfileFailure():
            return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  final ProfileModel state;

  const _DrawerHeader({required this.state});
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
            state.name,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            state.email,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 13.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          spaceH(10),
          Divider(color: Colors.blueGrey),
        ],
      ),
    );
  }
}
