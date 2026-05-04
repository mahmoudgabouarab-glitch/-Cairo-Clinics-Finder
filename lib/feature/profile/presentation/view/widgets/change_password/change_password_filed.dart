import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/app_validator.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/change_password/change_password_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
              hint: LocaleKeys.change_password_current_password.tr(),
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: AppValidator.passwordValidator(),
              controller: cubit.oldPasswordController,
            ),
            spaceH(12),
            CustomTextFormFiled(
              hint: LocaleKeys.change_password_new_password.tr(),
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: AppValidator.passwordValidator(),
              controller: cubit.newPasswordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            spaceH(12),
            CustomTextFormFiled(
              hint: LocaleKeys.change_password_confirm_password.tr(),
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return LocaleKeys.change_password_password_required.tr();
                }
                if (cubit.newPasswordController.text != val) {
                  return LocaleKeys.change_password_mismatch.tr();
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
  return Text(
    LocaleKeys.change_password_header.tr(),
    style: AppTextStyles.f14SemiBoldBlack,
  );
}
