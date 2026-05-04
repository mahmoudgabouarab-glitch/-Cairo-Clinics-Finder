import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/change_password/change_password_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordListener extends StatelessWidget {
  const ChangePasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        switch (state) {
          case ChangePasswordInitial():
            break;
          case ChangePasswordLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case ChangePasswordSuccess():
            context.pop();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.change_password_success.tr(),
              type: SnackBarType.success,
            );
            context.pop();
            break;
          case ChangePasswordFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
            break;
        }
      },
      child: Container(),
    );
  }
}
