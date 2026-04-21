import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class OneItemOfClinicList extends StatelessWidget {
  final ClinicModel clinic;
  const OneItemOfClinicList({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(GoTo.details, extra: {'clinic': clinic}),
      child: Container(
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
                color: AppColor.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: FaIcon(
                  ClinicTheme.markerIcon(clinic.category),
                  size: 24.sp,
                  color: ClinicTheme.markerColor(clinic.category),
                ),
              ),
            ),
            spaceW(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinic.name,
                    style: AppTextStyles.f13MediumBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                  spaceH(2),
                  Text(
                    "${clinic.category} | ${clinic.address}",
                    style: AppTextStyles.f11Grey,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                    Text(
                      clinic.rating.toString(),
                      style: AppTextStyles.f11Grey.copyWith(
                        color: Colors.black87,
                      ),
                    ),
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
                    clinic.isOpen ? 'Open' : 'Closed',
                    style: AppTextStyles.f10Black.copyWith(
                      color: clinic.isOpen ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
