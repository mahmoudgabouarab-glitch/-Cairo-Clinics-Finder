import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFilterChips extends StatelessWidget {
  const BuildFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) {
        return previous.selectedCategory != current.selectedCategory;
      },
      builder: (context, state) {
        return SizedBox(
          height: 36.h,
          child: ListView.builder(
            itemCount: categoryKeys.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final label = _getCategoryLabel(categoryKeys[index]);
              final isSelected = state.selectedCategory == categoryKeys[index];
              return GestureDetector(
                onTap: () {
                  context.read<MapCubit>().selectCategory(categoryKeys[index]);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: EdgeInsets.only(right: 6.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primary : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final categoryKeys = [
  'all',
  'dentist',
  'dermatology',
  'ophthalmology',
  'pediatrics',
  'cardiology',
  'orthopedics',
  'neurology',
  'gynecology',
  'urology',
  'ent',
];
String _getCategoryLabel(String key) {
  return key.replaceFirst(key[0], key[0].toUpperCase());
}
