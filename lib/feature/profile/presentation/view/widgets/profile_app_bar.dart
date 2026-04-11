import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: AppColor.primary,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Mahmoud Ahmed Elsayed",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
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
