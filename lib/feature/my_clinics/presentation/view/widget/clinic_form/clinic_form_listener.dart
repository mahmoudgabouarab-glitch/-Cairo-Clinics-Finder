import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClinicFormListener extends StatelessWidget {
  const ClinicFormListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClinicFormCubit, ClinicFormState>(
      listenWhen: (prev, curr) =>
          prev.isLoading != curr.isLoading || prev.error != curr.error,
      listener: (context, state) {
        final isEdit = context.read<ClinicFormCubit>().mode == Request.edit;
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
        if (!state.isLoading && state.isSuccess && state.error == null) {
          context.pop();
          context.pop();
          context.pushReplacement(GoTo.myClinics);
          CustomSnackBar.show(
            context,
            message: isEdit
                ? 'Clinic updated successfully'
                : 'Clinic added successfully',
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
