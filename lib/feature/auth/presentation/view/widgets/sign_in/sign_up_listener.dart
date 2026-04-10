import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signin/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInListener extends StatelessWidget {
  const SignInListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        switch (state) {
          case SignInInitial():
            break;
          case SignInLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case SignInSuccess():
            context.pop();
            CustomSnackBar.show(
              context,
              message: "Sign in successfully",
              type: SnackBarType.success,
            );
            context.pushReplacement(GoTo.home);
          case SignInFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
