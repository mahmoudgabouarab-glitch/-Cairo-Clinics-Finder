import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/change_password/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordFiled extends StatelessWidget {
  const ChangePasswordFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return CustomCard(
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            spaceH(16),
            CustomTextFormFiled(
              hint: "Current Password",
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter your current password';
                }
                return null;
              },
              controller: cubit.oldPasswordController,
            ),
            spaceH(12),
            CustomTextFormFiled(
              hint: "New Password",
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter your new password';
                }
                return null;
              },
              controller: cubit.newPasswordController,
            ),
            spaceH(12),
            CustomTextFormFiled(
              hint: "Confirm Password",
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: (val) {
                if (cubit.newPasswordController.text != val) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _title() {
  return Text('Update your password', style: AppTextStyles.f14SemiBoldBlack);
}
