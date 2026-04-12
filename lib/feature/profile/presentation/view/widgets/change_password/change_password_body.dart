import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_title_icon.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/change_password/change_password_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        children: [
          CustomTitleIcon(icon: Icons.lock_reset_outlined),
          spaceH(32),
          ChangePasswordFiled(),
          spaceH(32),
          Btn(onPressed: () {}, text: "Update Password"),
        ],
      ),
    );
  }
}
