import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/list_of_clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4.h,
      minChildSize: 0.15.h,
      maxChildSize: 0.8.h,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                spaceH(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby places',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '0 found',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                spaceH(10),
                const ListOfClinic(),
              ],
            ),
          ),
        );
      },
    );
  }
}
