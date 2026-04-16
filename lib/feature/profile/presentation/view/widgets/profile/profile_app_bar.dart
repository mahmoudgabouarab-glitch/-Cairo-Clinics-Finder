import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget {
  final ProfileModel state;
  const ProfileAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: AppColor.primary,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(state.name, style: AppTextStyles.f12BoldBlack),
        ),
        centerTitle: true,
        background: Container(
          decoration: const BoxDecoration(gradient: AppColor.detailsAppBar),
          child: Center(
            child: CircleAvatar(
              radius: 48.r,
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, size: 48.r, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
