import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view_model/cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkingHoursCard extends StatelessWidget {
  const WorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClinicCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Opening Time",
            readOnly: true,
            prefixIcon: Icons.wb_sunny_outlined,
            controller: cubit.openingController,
            onTap: () async {
              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: _builderTheme(),
              );
              if (time == null) return;
              cubit.openingController.text = formatTime(time);
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your opening time';
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "Closing Time",
            readOnly: true,
            prefixIcon: Icons.nights_stay_outlined,
            controller: cubit.closingController,
            onTap: () async {
              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: _builderTheme(),
              );
              if (time == null) return;
              cubit.closingController.text = formatTime(time);
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your closing time';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

Widget Function(BuildContext, Widget?)? _builderTheme() {
  return (context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(primary: AppColor.primary),
      ),
      child: child!,
    );
  };
}

String formatTime(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
