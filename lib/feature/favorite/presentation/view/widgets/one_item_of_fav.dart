import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneItemOfFav extends StatelessWidget {
  const OneItemOfFav({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: const Color(0xFFe0f2f1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.local_hospital_outlined,
              color: AppColor.primary,
              size: 26.r,
            ),
          ),
          spaceW(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Ahmed Cardiology Center',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                spaceH(4),
                Text(
                  'Cardiology • Cairo',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                ),
                spaceH(4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14.r),
                    spaceW(4),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: AppColor.clinicRed, size: 22.r),
          ),
        ],
      ),
    );
  }
}
