import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/presentation/view_model/cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddClinicMapBottonSheet extends StatelessWidget {
  const AddClinicMapBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Choose Location",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => context.pop(),
                child: Icon(Icons.cancel_outlined),
              ),
            ],
          ),
          Divider(height: 14.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Click Map To Select",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              MaterialButton(
                elevation: 0,
                color: Color(0xffECECEC),
                onPressed: () {
                  context.read<AddClinicCubit>().goToMyLocation();
                },
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: AppColor.primary),
                    Text(
                      "Your Current Location",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          spaceH(18),
          Container(
            height: 285.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: AddClinicMap(),
          ),
          spaceH(16),
          _buildBtn(),
          spaceH(100),
        ],
      ),
    );
  }
}

Widget _buildBtn() {
  return BlocBuilder<AddClinicCubit, AddClinicState>(
    builder: (context, state) {
      if (state is! AddClinicLocationLoaded || !state.isUserSelection) {
        return const SizedBox.shrink();
      }
      return Btn(onPressed: () => context.pop(), text: "Confirm");
    },
  );
}

class AddClinicMap extends StatelessWidget {
  const AddClinicMap({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClinicCubit>();
    return BlocBuilder<AddClinicCubit, AddClinicState>(
      builder: (context, state) {
        return state is AddClinicLocationLoaded
            ? FlutterMap(
                mapController: cubit.mapController,
                options: MapOptions(
                  initialCenter: state.location,
                  initialZoom: 10,
                  onTap: (tapPosition, point) => cubit.onMapTap(point),
                ),
                // mapController: mapController,
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.cairo_clinics_finder',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: state.location,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
