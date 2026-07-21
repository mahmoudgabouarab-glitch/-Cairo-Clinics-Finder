import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart' show Lottie;

/// Inverts tile luminance so the light OSM basemap reads as a dark map
/// (land becomes dark, roads/labels become light).
Widget _darkTileBuilder(BuildContext context, Widget tileWidget, TileImage tile) {
  return ColorFiltered(
    colorFilter: const ColorFilter.matrix(<double>[
      -0.2126, -0.7152, -0.0722, 0, 255, //
      -0.2126, -0.7152, -0.0722, 0, 255, //
      -0.2126, -0.7152, -0.0722, 0, 255, //
      0, 0, 0, 1, 0, //
    ]),
    child: tileWidget,
  );
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Read here so the map (tiles + markers) rebuilds instantly on theme change.
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) {
        return previous.userLocation != current.userLocation ||
            previous.clinics != current.clinics ||
            previous.isLoading != current.isLoading;
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Lottie.asset(
              "assets/loading.json",
              width: 250.w,
              height: 250.h,
              repeat: true,
            ),
          );
        }
        return FlutterMap(
          mapController: context.read<MapCubit>().controller,
          options: MapOptions(
            initialCenter: state.userLocation!,
            initialZoom: 14.5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.cairo_clinics_finder',
              // OSM tiles are always light; invert their luminance in dark mode.
              tileBuilder: isDark ? _darkTileBuilder : null,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: state.userLocation!,
                  width: 60.w,
                  height: 60.h,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primary.withOpacity(isDark ? 0.28 : 0.15),
                    ),
                    child: Center(
                      child: Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark ? AppColor.darkPrimary : AppColor.primary,
                          border: Border.all(
                            color: isDark ? AppColor.darkBackground : Colors.white,
                            width: 2.5.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ...state.clinics.map((clinic) {
                  return Marker(
                    point: clinic.latLng,
                    width: 45.w,
                    height: 45.h,
                    child: GestureDetector(
                      onTap: () =>
                          context.push(GoTo.details, extra: {'clinic': clinic}),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark ? AppColor.darkSurface : Colors.white,
                          border: Border.all(
                            color: ClinicTheme.markerColor(clinic.category),
                            width: (isDark ? 2 : 1.5).w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(isDark ? 0.5 : 0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: FaIcon(
                            ClinicTheme.markerIcon(clinic.category),
                            color: ClinicTheme.markerColor(clinic.category),
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
