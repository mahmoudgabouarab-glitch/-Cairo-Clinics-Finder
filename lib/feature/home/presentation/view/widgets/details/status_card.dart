import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final ClinicModel clinic;
  const StatusCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber),
          spaceW(4),
          Text(clinic.rating.toString(), style: AppTextStyles.f14MediumBlack),
          spaceW(4),
          Text('(${clinic.reviewCount} reviews)', style: AppTextStyles.f12Grey),
          const Spacer(),
          // Open/Closed badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: clinic.isOpen
                  ? AppColor.openGreen.withOpacity(0.1)
                  : AppColor.clinicRed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              clinic.isOpen ? 'Open' : 'Closed',
              style: AppTextStyles.f12BoldGreen.copyWith(
                color: clinic.isOpen ? AppColor.openGreen : AppColor.clinicRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
