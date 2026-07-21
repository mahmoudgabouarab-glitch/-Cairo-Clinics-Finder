import 'package:flutter/material.dart';

class AppColor {
  static const primary = Colors.teal;
  static const iconBg = Color(0xFFe0f2f1);
  static const clinicRed = Color(0xFFE53935);
  static const background = Color(0xFFE8F5E9);
  static const cardBg = Color(0xFFF9F9F9);
  static const textPrimary = Colors.black87;
  static const textSecondary = Color(0xFF888888);
  static const textOnPrimary = Color(0xFFFFFFFF);
  static const textAccent = primary;
  static const openGreen = Color(0xFF2E7D32);

  // ---------- Dark theme palette ----------
  static const darkPrimary = Color(0xFF4DB6AC); // teal 300 (better contrast)
  static const darkBackground = Color(0xFF0F1417); // scaffold
  static const darkSurface = Color(0xFF1A2226); // cards / app bars / sheets
  static const darkSurfaceVariant = Color(0xFF222D33); // input fills
  static const darkTextPrimary = Color(0xFFE4E8EA);
  static const darkTextSecondary = Color(0xFF9BA6AC);
  static const darkDivider = Color(0xFF2B373D);
  static const darkIconBg = Color(0xFF1F2C31);

  // ---------- Theme-adaptive helpers (identical to the light values in
  // light mode, dark equivalents in dark mode) ----------
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// Input fills / subtle surfaces.
  static Color fieldFill(BuildContext context) =>
      _isDark(context) ? darkSurfaceVariant : cardBg;

  /// Card-like surfaces (elevated over the scaffold).
  static Color surface(BuildContext context) =>
      _isDark(context) ? darkSurface : Colors.white;

  /// Tinted icon / avatar chips.
  static Color chipBg(BuildContext context) =>
      _isDark(context) ? darkIconBg : iconBg;

  /// The soft green tile used behind clinic list icons.
  static Color softTile(BuildContext context) =>
      _isDark(context) ? darkIconBg : background;
  static const detailsAppBar = LinearGradient(
    colors: [Colors.teal, Color(0xFF00796B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const onBoardingBar = LinearGradient(
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
