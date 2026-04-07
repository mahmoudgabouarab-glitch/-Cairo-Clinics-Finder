import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoToMyLocationBtn extends StatelessWidget {
  const GoToMyLocationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 170.h,
      right: 16.w,
      child: FloatingActionButton(
        backgroundColor: AppColor.cardBg,
        onPressed: () => context.read<MapCubit>().goToMyLocation(),
        child: Icon(Icons.my_location, color: AppColor.primary, size: 24.sp),
      ),
    );
  }
}
