import 'package:flutter/material.dart';

class AppColor {
  static const primary = Colors.teal;
  static const iconBg = Color(0xFFe0f2f1);
  static const clinicRed = Color(0xFFE53935);
  static const background = Color(0xFFE8F5E9);
  static const cardBg = Color(0xFFF9F9F9);
  static const textSecondary = Color(0xFF888888);
  static const openGreen = Color(0xFF2E7D32);
  static const detailsAppBar = LinearGradient(
    colors: [Colors.teal, Color(0xFF00796B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const onBordingBar = LinearGradient(
    colors: [Colors.teal, Color(0xFFF0F4F8)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const drawer = LinearGradient(
    colors: [Colors.teal, Color(0xFFF0F4F8)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
