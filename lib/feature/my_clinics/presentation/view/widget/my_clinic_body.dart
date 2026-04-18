import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/one_item_of_my_clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyClinicBody extends StatelessWidget {
  const MyClinicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemCount: 10,
      separatorBuilder: (_, _) => spaceH(12),
      itemBuilder: (_, index) => const OneItemOfMyClinic(),
    );
  }
}
