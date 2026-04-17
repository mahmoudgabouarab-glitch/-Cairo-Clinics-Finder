import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        minHeight: 6,
        backgroundColor: Colors.grey.shade200,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColor.primary),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}