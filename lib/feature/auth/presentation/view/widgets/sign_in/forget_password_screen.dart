import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_field.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/Auth_title.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_title_icon.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ForgetPasswordInitial():
            break;
          case ForgetPasswordLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case ForgetPasswordSuccess():
            context.pop();
            CustomSnackBar.show(
              context,
              message: "Check your email",
              type: SnackBarType.success,
            );
            context.pushReplacement(GoTo.signIn);
            break;
          case ForgetPasswordFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
            break;
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                const Spacer(),
                const CustomTitleIcon(icon: Icons.lock_reset_outlined),
                spaceH(32),
                const AuthTitle(title: "Forgot password?"),
                spaceH(12),
                _subtitle(),
                spaceH(40),
                CustomTextFormField(
                  hint: "Email",
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: cubit.emailController,
                ),
                const Spacer(),
                Btn(
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.forgetPassword();
                    }
                  },
                  text: "Send reset link",
                ),
                spaceH(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _subtitle() {
  return Text(
    "Enter your email and we'll send you a reset link",
    style: AppTextStyles.f14Grey.copyWith(height: 1.6, color: Colors.grey[500]),
  );
}
