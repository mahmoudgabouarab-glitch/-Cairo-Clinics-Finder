import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookongInfoCard extends StatelessWidget {
  const BookongInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Booking Type",
            prefixIcon: Icons.event_note_outlined,
            controller: cubit.bookingController,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon: const Icon(Icons.expand_more),
              itemBuilder: (context) => _bookingType
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e.replaceAll(e[0], e[0].toUpperCase())),
                    ),
                  )
                  .toList(),
              onSelected: (value) => cubit.bookingController.text = value,
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please choose your booking type';
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormFiled(
            hint: "Consultation Fee",
            prefixIcon: Icons.attach_money_outlined,
            controller: cubit.priceController,
            keybordtype: TextInputType.number,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your Consultation Fee';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

List<String> _bookingType = ["appointment", "walk in"];
