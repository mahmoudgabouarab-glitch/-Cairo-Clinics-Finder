import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        switch (state) {
          case SignUpInitial():
            break;
          case SignUpLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case SignUpSuccess():
            context.pop();
            context.push(GoTo.verified, extra: state.user.email);
            break;
          case SignUpFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
            break;
          case SignUpPickImage():
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
