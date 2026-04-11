import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile_cubit.dart';
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
            break;
          case EditProfileFailure():
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
