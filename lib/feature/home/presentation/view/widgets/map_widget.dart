import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) {
        return previous.userLocation != current.userLocation ||
            previous.clinics != current.clinics ||
            previous.selectedClinic != current.selectedClinic ||
            previous.isLoading != current.isLoading;
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return FlutterMap(
          options: MapOptions(
            initialCenter: state.userLocation!,
            initialZoom: 14.5,
            onTap: (_, _) => context.read<MapCubit>().clearSelectedClinic(),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.cairo_clinics_finder',
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
                      color: AppColor.primary.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary,
                          border: Border.all(color: Colors.white, width: 2.5.w),
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
                          context.read<MapCubit>().selectClinic(clinic),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: ClinicTheme.markerColor(clinic.category),
                            width: state.selectedClinic?.id == clinic.id
                                ? 3.w
                                : 1.5.w,
                          ),
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
