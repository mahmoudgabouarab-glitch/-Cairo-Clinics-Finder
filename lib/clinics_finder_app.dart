import 'package:cairo_clinics_finder/core/routing/routing_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicsFinderApp extends StatelessWidget {
  const ClinicsFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF0F4F8),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF0F4F8)),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouting.router,
      ),
    );
  }
}
