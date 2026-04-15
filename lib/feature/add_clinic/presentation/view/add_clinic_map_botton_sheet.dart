
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

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
                  //context.read<RegisterPostCubit>().getCurrentLocationcubit();
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
          Btn(onPressed: () {}, text: "Confirm"),
          spaceH(100),
        ],
      ),
    );
  }
}

class AddClinicMap extends StatelessWidget {
  const AddClinicMap({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(30.0444, 31.2357),
        initialZoom: 10,
      ),
      // mapController: mapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.cairo_clinics_finder',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(30.0454, 31.2367),
              width: 40,
              height: 40,
              child: GestureDetector(
                onTap: () {
                  // context.read<RegisterPostCubit>().setLocation(location);
                  // print(location);
                },
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
