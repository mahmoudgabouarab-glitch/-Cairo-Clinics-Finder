import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final ClinicModel clinic;
  const StatusCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber),
          spaceW(4),
          Text(
            clinic.rating.toString(),
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          spaceW(4),
          Text(
            '(${clinic.reviewCount} reviews)',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          ),
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
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: clinic.isOpen ? AppColor.openGreen : AppColor.clinicRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
