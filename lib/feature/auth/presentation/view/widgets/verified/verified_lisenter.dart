import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/verified/verified_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifiedLisenter extends StatelessWidget {
  const VerifiedLisenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifiedCubit, VerifiedState>(
      listener: (context, state) {
        switch (state) {
          case VerifiedInitial():
            break;
          case VerifiedLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case VerifiedSuccess():
            context.pop();
            context.pushReplacement(GoTo.home);
            break;
          case ResendVerifiedSuccess():
            context.pop();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.verification_resend_success.tr(),
              type: SnackBarType.success,
            );
            break;
          case VerifiedFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.verification_not_verified.tr(),
              type: SnackBarType.error,
            );
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
