import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_drawer_item.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          DrawerItem(
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () =>
                context.push(GoTo.profile, extra: context.read<ProfileCubit>()),
          ),
          DrawerItem(
            icon: Icons.add_business_outlined,
            title: 'Add Clinic',
            onTap: () => context.push(GoTo.addClinic),
          ),
          DrawerItem(
            icon: Icons.favorite_outline,
            title: 'Favorites',
            onTap: () =>
                context.push(GoTo.fav, extra: context.read<FavCubit>()),
          ),
          DrawerItem(
            icon: Icons.info_outline,
            title: 'About',
            onTap: () => context.push(GoTo.about),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileInitial():
            return const SizedBox.shrink();
          case ProfileLoading():
            return const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            );
          case ProfileSuccess():
            return Container(
              decoration: BoxDecoration(
                gradient: AppColor.drawer.withOpacity(0.75),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.person, size: 24.r, color: Colors.white),
                  ),
                  spaceH(12),
                  Text(
                    state.profile.name,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.profile.email,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  spaceH(10),
                  const Divider(color: Colors.blueGrey),
                ],
              ),
            );
          case ProfileFailure():
            return Center(child: Text(state.message));
        }
      },
    );
  }
}
