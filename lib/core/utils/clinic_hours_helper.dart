import 'package:flutter/material.dart';

class ClinicHoursHelper {
  static bool isOpenNow(String hours, String offDay) {
    try {
      if (offDay.isNotEmpty) {
        final today = _getTodayName();
        final offDays = offDay.split(',').map((d) => d.trim().toLowerCase());
        if (offDays.contains(today.toLowerCase())) return false;
      }
      final parts = hours.split(' - ');
      if (parts.length != 2) return false;

      final now = TimeOfDay.now();
      final open = _parse(parts[0].trim());
      final close = _parse(parts[1].trim());

      if (open == null || close == null) return false;

      final nowMinutes = now.hour * 60 + now.minute;
      final openMinutes = open.hour * 60 + open.minute;
      final closeMinutes = close.hour * 60 + close.minute;

      if (closeMinutes < openMinutes) {
        return nowMinutes >= openMinutes || nowMinutes < closeMinutes;
      }

      return nowMinutes >= openMinutes && nowMinutes < closeMinutes;
    } catch (_) {
      return false;
    }
  }

  static TimeOfDay? _parse(String time) {
    final regex = RegExp(r'(\d+):(\d+)\s*(AM|PM)', caseSensitive: false);
    final match = regex.firstMatch(time);
    if (match == null) return null;

    int hour = int.parse(match.group(1)!);
    final int minute = int.parse(match.group(2)!);
    final String period = match.group(3)!.toUpperCase();

    if (period == 'AM') {
      if (hour == 12) hour = 0;
    } else {
      if (hour != 12) hour += 12;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  static String _getTodayName() {
    const map = {
      1: 'mon',
      2: 'tue',
      3: 'wed',
      4: 'thu',
      5: 'fri',
      6: 'sat',
      7: 'sun',
    };
    return map[DateTime.now().weekday]!;
  }
}
