import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/signout/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutListener extends StatelessWidget {
  const SignOutListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        switch (state) {
          case SignOutInitial():
            break;
          case SignOutLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case SignOutSuccess():
            context.pop();
            context.go(GoTo.onBoarding);
            break;
          case SignOutFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
