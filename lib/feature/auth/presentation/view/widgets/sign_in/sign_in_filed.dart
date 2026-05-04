import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signin/sign_in_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFiled extends StatelessWidget {
  const SignInFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          spaceH(40),
          CustomTextFormFiled(
            hint: LocaleKeys.signin_email_hint.tr(),
            prefixIcon: Icons.email_outlined,
            controller: cubit.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.signin_email_required.tr();
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            hint: LocaleKeys.signin_password_hint.tr(),
            obscureText: true,
            prefixIcon: Icons.lock,
            controller: cubit.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.signin_password_required.tr();
              }
              return null;
            },
          ),
          spaceH(12),
        ],
      ),
    );
  }
}
