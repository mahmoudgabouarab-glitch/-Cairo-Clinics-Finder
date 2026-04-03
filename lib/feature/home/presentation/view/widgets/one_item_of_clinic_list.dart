import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneItemOfClinicList extends StatelessWidget {
  final String name;
  final String category;
  const OneItemOfClinicList({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> bgColors = {
      'clinic': AppColor.background,
      'pharmacy': AppColor.background,
      'hospital': AppColor.background,
    };
    final Map<String, Color> textColors = {
      'clinic': AppColor.clinicRed,
      'pharmacy': AppColor.pharmacyGreen,
      'hospital': AppColor.hospitalBlue,
    };
    final Map<String, String> labels = {
      'clinic': '+',
      'pharmacy': 'Rx',
      'hospital': 'H',
    };
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColor.cardBg,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: bgColors[category],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                labels[category]!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: textColors[category],
                ),
              ),
            ),
          ),
          spaceW(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  'category · 0.0 km',
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.star, size: 11.sp, color: Colors.amber),
                  spaceW(2),
                  Text('0.0', style: TextStyle(fontSize: 11.sp)),
                ],
              ),
              spaceH(4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'Open',
                  style: TextStyle(fontSize: 10.sp, color: AppColor.openGreen),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
