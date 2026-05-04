import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_import.dart';
import 'package:cairo_clinics_finder/feature/favorite/data/repo/fav_repo.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicsFinderApp extends StatelessWidget {
  const ClinicsFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: BlocProvider(
        create: (_) => FavCubit(getIt<FavRepo>())..getFav(),
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF0F4F8),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF0F4F8)),
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          key: ValueKey(context.locale),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouting.router,
        ),
      ),
    );
  }
}
