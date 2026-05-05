import 'package:cairo_clinics_finder/core/utils/app_validator.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_field.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFiled extends StatelessWidget {
  const SignUpFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          spaceH(16),
          CustomTextFormField(
            hint: LocaleKeys.signup_name_hint.tr(),
            prefixIcon: Icons.person,
            controller: cubit.nameController,
            validator: AppValidator.nameValidator(),
          ),
          spaceH(16),
          CustomTextFormField(
            hint: LocaleKeys.signup_phone_hint.tr(),
            prefixIcon: Icons.phone,
            controller: cubit.phoneController,
            validator: AppValidator.phoneValidator(),
            keybordtype: TextInputType.phone,
          ),
          spaceH(16),
          CustomTextFormField(
            hint: LocaleKeys.signup_email_hint.tr(),
            prefixIcon: Icons.email_outlined,
            controller: cubit.emailController,
            validator: AppValidator.emailValidator(),
          ),
          spaceH(16),
          CustomTextFormField(
            hint: LocaleKeys.signup_password_hint.tr(),
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: true,
            controller: cubit.passwordController,
            validator: AppValidator.passwordValidator(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          spaceH(16),
          CustomTextFormField(
            hint: LocaleKeys.signup_confirm_password_hint.tr(),
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: true,
            controller: cubit.confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.signup_password_required.tr();
              }
              if (cubit.passwordController.text != value) {
                return LocaleKeys.signup_password_mismatch.tr();
              }
              return null;
            },
          ),
          spaceH(32),
        ],
      ),
    );
  }
}
