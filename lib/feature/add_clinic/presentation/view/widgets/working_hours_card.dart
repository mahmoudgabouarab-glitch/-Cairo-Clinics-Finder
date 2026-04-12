import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class WorkingHoursCard extends StatelessWidget {
  const WorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Opening Time",
            readOnly: true,
            prefixIcon: Icons.wb_sunny_outlined,
            onTap: () async {
              await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: _builderTheme(),
              );
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "Closing Time",
            readOnly: true,
            prefixIcon: Icons.nights_stay_outlined,
            onTap: () async {
              await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: _builderTheme(),
              );
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
