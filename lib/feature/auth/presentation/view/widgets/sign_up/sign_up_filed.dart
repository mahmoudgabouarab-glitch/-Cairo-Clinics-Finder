import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
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
          spaceH(40),
          CustomTextFormFiled(
            hint: "Name",
            prefixIcon: Icons.person,
            controller: cubit.nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            hint: "Phone",
            prefixIcon: Icons.phone,
            controller: cubit.phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            hint: "Email",
            prefixIcon: Icons.email_outlined,
            controller: cubit.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            hint: "Password",
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: true,
            controller: cubit.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            hint: "Confirm Password",
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: true,
            controller: cubit.confirmPasswordController,
            validator: (value) {
              if (cubit.passwordController.text != value) {
                return 'Password does not match';
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
