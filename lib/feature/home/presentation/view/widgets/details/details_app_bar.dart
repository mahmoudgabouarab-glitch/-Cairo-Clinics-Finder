import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsAppBar extends StatelessWidget {
  final ClinicModel clinic;

  const DetailsAppBar({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.teal,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            clinic.name,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(gradient: AppColor.detailsAppBar),
          child: Center(
            child: FaIcon(
              ClinicTheme.markerIcon(clinic.category),
              size: 80.sp,
              color: Colors.white24,
            ),
          ),
        ),
      ),
    );
  }
}
