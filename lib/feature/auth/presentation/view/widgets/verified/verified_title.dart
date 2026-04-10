import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifiedTitle extends StatelessWidget {
  const VerifiedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Check your inbox',
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }
}