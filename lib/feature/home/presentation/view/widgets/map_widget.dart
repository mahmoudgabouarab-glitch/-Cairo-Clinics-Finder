import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is MapLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MapFailure) {
          return Center(child: Text(state.message));
        }
        if (state is MapSuccess) {
          return FlutterMap(
            options: MapOptions(
              initialCenter: state.userLocation,
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
                    point: state.userLocation,
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
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ...state.filteredClinics.map((clinic) {
                    return Marker(
                      point: clinic.latLng,
                      width: 56.w,
                      height: 56.h,
                      child: _ClinicMarker(
                        clinic: clinic,
                        isSelected: state.selectedClinic?.id == clinic.id,
                      ),
                    );
                  }),
                ],
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class _ClinicMarker extends StatelessWidget {
  final ClinicModel clinic;
  final bool isSelected;
  const _ClinicMarker({required this.clinic, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<MapCubit>().selectClinic(clinic),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: _markerColor(clinic.category),
            width: isSelected ? 3.w : 1.5.w,
          ),
        ),
        child: Center(
          child: Icon(
            _markerLabel(clinic.category),
            color: _markerColor(clinic.category),
          ),
        ),
      ),
    );
  }
}

Color _markerColor(String category) {
  switch (category) {
    case 'pharmacy':
      return const Color(0xFF43A047);
    case 'hospital':
      return const Color(0xFF1565C0);
    default:
      return const Color(0xFFE53935);
  }
}

IconData _markerLabel(String category) {
  switch (category) {
    case 'pharmacy':
      return Icons.local_pharmacy;
    case 'hospital':
      return Icons.local_hospital;
    default:
      return Icons.sick;
  }
}
