import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileListener extends StatelessWidget {
  const EditProfileListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        switch (state) {
          case EditProfileInitial():
            break;
          case EditProfileLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
            break;
          case EditProfileSuccess():
            context.pop();
            context.read<ProfileCubit>().getProfile();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.edit_profile_success.tr(),
              type: SnackBarType.success,
            );
            context.pop();
            break;
          case EditProfileFailure():
            context.pop();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
            break;
          case EditProfilePickImage():
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
