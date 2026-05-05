import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_field.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingInfoCard extends StatelessWidget {
  const BookingInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    List<String> bookingType = ["appointment", "walk_in"];
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormField(
            hint: LocaleKeys.clinic_form_booking_type.tr(),
            prefixIcon: Icons.event_note_outlined,
            controller: cubit.bookingController,
            readOnly: true,
            suffix: PopupMenuButton(
              constraints: BoxConstraints(maxHeight: 250.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              icon: const Icon(Icons.expand_more),
              itemBuilder: (context) => bookingType
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text("clinic_form.$e".tr()),
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                cubit.bookingController.text = "clinic_form.$value".tr();
                cubit.selectedBookingValue = value;
              },
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.clinic_form_booking_required.tr();
              }
              return null;
            },
          ),
          spaceH(12),
          CustomTextFormField(
            hint: LocaleKeys.clinic_form_fee.tr(),
            prefixIcon: Icons.attach_money_outlined,
            controller: cubit.priceController,
            keybordtype: TextInputType.number,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.clinic_form_fee_required.tr();
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
