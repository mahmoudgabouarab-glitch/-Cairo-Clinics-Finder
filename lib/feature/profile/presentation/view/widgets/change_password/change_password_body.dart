import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_title_icon.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/change_password/change_password_filed.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/change_password/change_password_listener.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/change_password/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          const CustomTitleIcon(icon: Icons.lock_reset_outlined),
          spaceH(32),
          const ChangePasswordFiled(),
          spaceH(32),
          Btn(
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.changePassword();
              }
            },
            text: "Update Password",
          ),
          const ChangePasswordListener(),
        ],
      ),
    );
  }
}
