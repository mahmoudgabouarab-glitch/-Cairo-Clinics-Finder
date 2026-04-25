import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClinicTheme {
  static Color markerColor(String category) {
    switch (category) {
      case 'dentist':
        return const Color(0xFF1E88E5);
      case 'dermatology':
        return const Color(0xFFE91E63);
      case 'ophthalmology':
        return const Color(0xFF00ACC1);
      case 'pediatrics':
        return const Color(0xFFFF7043);
      case 'cardiology':
        return const Color(0xFFE53935);
      case 'orthopedics':
        return const Color(0xFF6D4C41);
      case 'neurology':
        return const Color(0xFF5E35B1);
      case 'gynecology':
        return const Color(0xFFD81B60);
      case 'urology':
        return const Color(0xFF039BE5);
      case 'ent':
        return const Color(0xFF43A047);
      default:
        return const Color(0xFF757575);
    }
  }

  static FaIconData markerIcon(String category) {
    switch (category) {
      case 'dentist':
        return FontAwesomeIcons.tooth;
      case 'dermatology':
        return FontAwesomeIcons.handDots;
      case 'ophthalmology':
        return FontAwesomeIcons.eye;
      case 'pediatrics':
        return FontAwesomeIcons.baby;
      case 'cardiology':
        return FontAwesomeIcons.heartPulse;
      case 'orthopedics':
        return FontAwesomeIcons.bone;
      case 'neurology':
        return FontAwesomeIcons.brain;
      case 'gynecology':
        return FontAwesomeIcons.venus;
      case 'urology':
        return FontAwesomeIcons.flaskVial;
      case 'ent':
        return FontAwesomeIcons.earListen;
      default:
        return FontAwesomeIcons.userDoctor;
    }
  }
}
