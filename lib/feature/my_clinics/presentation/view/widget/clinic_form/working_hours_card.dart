import 'dart:developer';

import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursCard extends StatelessWidget {
  const WorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_opening_time.tr(),
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
                return LocaleKeys.clinic_form_opening_time_required.tr();
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_closing_time.tr(),
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
                return LocaleKeys.clinic_form_closing_time_required.tr();
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: LocaleKeys.clinic_form_break_time.tr(),
            readOnly: true,
            prefixIcon: Icons.calendar_today_outlined,
            controller: cubit.breakTimeController,
            onTap: () async {
              await showWorkingDaysDialog(context, cubit);
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.clinic_form_break_time_required.tr();
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

Future<void> showWorkingDaysDialog(
  BuildContext context,
  ClinicFormCubit cubit,
) async {
  const days = ["sat", "sun", "mon", "tue", "wed", "thu", "fri"];
  final selected = <String>{};
  await showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(
          LocaleKeys.clinic_form_select_break_time.tr(),
          style: AppTextStyles.f14SemiBoldBlack,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2,
            children: days.map((day) {
              final isSelected = selected.contains(day);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected ? selected.remove(day) : selected.add(day);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primary : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isSelected ? AppColor.primary : Colors.grey[300]!,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "clinic_form.$day".tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              LocaleKeys.clinic_form_cancel.tr(),
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              final sorted = days.where((d) => selected.contains(d)).toList();
              cubit.selectedBreakTimeValue = sorted.join(', ');
              cubit.breakTimeController.text = sorted
                  .map((d) => 'clinic_form.$d'.tr())
                  .join(', ');
              Navigator.pop(ctx);
              log(cubit.selectedBreakTimeValue);
            },
            child: Text(
              LocaleKeys.clinic_form_confirm.tr(),
              style: TextStyle(color: AppColor.primary),
            ),
          ),
        ],
      ),
    ),
  );
}
