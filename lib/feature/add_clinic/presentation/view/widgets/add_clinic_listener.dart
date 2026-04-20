import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view_model/cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddClinicListener extends StatelessWidget {
  const AddClinicListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddClinicCubit, AddClinicState>(
      listenWhen: (prev, curr) =>
          prev.isLoading != curr.isLoading || prev.error != curr.error,
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          );
          return;
        }
        if (!state.isLoading && state.error == null) {
          context.pop();
          context.pop();
          CustomSnackBar.show(
            context,
            message: 'Clinic added successfully',
            type: SnackBarType.success,
          );
        }
        if (state.error != null) {
          context.pop();
          CustomSnackBar.show(
            context,
            message: state.error!,
            type: SnackBarType.error,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
