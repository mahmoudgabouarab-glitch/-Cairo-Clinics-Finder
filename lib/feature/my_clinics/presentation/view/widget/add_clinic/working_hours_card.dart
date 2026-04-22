import 'dart:developer';

import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/add_clinic_cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          spaceH(12),
          CustomTextFormFiled(
            hint: "Break Time",
            readOnly: true,
            prefixIcon: Icons.calendar_today_outlined,
            controller: cubit.breakTimeController,
            onTap: () async {
              await showWorkingDaysDialog(context, cubit);
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please select your break time';
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
  AddClinicCubit cubit,
) async {
  const days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  final selected = <String>{};
  if (cubit.breakTimeController.text.isNotEmpty) {
    selected.addAll(cubit.breakTimeController.text.split(', '));
  }
  await showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text('Select Break Time', style: AppTextStyles.f14SemiBoldBlack),
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
                    day,
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
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              // رتبهم بترتيب الأيام مش ترتيب الاختيار
              final sorted = days.where((d) => selected.contains(d)).toList();
              cubit.breakTimeController.text = sorted.join(', ');
              Navigator.pop(ctx);
              log(cubit.breakTimeController.text);
            },
            child: Text('Confirm', style: TextStyle(color: AppColor.primary)),
          ),
        ],
      ),
    ),
  );
}
