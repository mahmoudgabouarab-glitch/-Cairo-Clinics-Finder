import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/app_validator.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/clinic_form/clinic_form_map_botton_sheet.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    return CustomCard(
      child: Column(
        children: [
          CustomTextFormFiled(
            hint: "Address",
            prefixIcon: Icons.location_on_outlined,
            controller: cubit.addressController,
            validator: AppValidator.nameValidator(),
          ),
          spaceH(12),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
                builder: (_) {
                  return BlocProvider.value(
                    value: cubit,
                    child: const ClinicFormMapBottonSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: const Color(0xFFe0f2f1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, color: Colors.teal, size: 20.r),
                  spaceW(8),
                  Text(
                    'Pick location from map',
                    style: AppTextStyles.f13BoldPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
