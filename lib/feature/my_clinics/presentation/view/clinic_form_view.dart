import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/clinic_form_body.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClinicFormView extends StatelessWidget {
  const ClinicFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = context.read<ClinicFormCubit>().mode == Request.edit;

    return Scaffold(
      appBar: CustomAppBar(
        title: isEdit
            ? LocaleKeys.clinic_form_edit_title.tr()
            : LocaleKeys.clinic_form_add_title.tr(),
      ),
      body: const ClinicFormBody(),
    );
  }
}
