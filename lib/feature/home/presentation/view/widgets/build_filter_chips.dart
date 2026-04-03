import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFilterChips extends StatefulWidget {
  const BuildFilterChips({super.key});

  @override
  State<BuildFilterChips> createState() => _BuildFilterChipsState();
}

class _BuildFilterChipsState extends State<BuildFilterChips> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final label = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 28.h,
              margin: EdgeInsets.only(right: 6.w),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: isSelected == index ? AppColor.primary : Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected == index ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final categories = [
  'All',
  '+ Clinics',
  'Rx Pharmacy',
  'H Hospital',
  'Pharmacy',
  'Clinic',
  'Hospital',
];
