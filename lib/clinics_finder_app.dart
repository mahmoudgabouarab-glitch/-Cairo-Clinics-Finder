import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_import.dart';
import 'package:cairo_clinics_finder/core/utils/app_theme.dart';
import 'package:cairo_clinics_finder/core/utils/theme_cubit/theme_cubit.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => FavCubit(getIt<FavRepo>())..getFav()),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              key: ValueKey(context.locale),
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouting.router,
            );
          },
        ),
      ),
    );
  }
}
