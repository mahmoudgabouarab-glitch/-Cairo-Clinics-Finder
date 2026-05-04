import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/clinic_form_cubit/clinic_form_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ClinicFormMapBottonSheet extends StatelessWidget {
  const ClinicFormMapBottonSheet({super.key});

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
                LocaleKeys.clinic_form_choose_title.tr(),
                style: AppTextStyles.f16MediumBlack,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
          Divider(height: 14.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.clinic_form_click_map.tr(),
                  style: AppTextStyles.f12MediumBlack.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              MaterialButton(
                elevation: 0,
                color: const Color(0xffECECEC),
                onPressed: () {
                  context.read<ClinicFormCubit>().goToMyLocation();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.primary,
                    ),
                    Text(
                      LocaleKeys.clinic_form_your_location.tr(),
                      style: AppTextStyles.f12Black,
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
            child: const AddClinicMap(),
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
  return BlocBuilder<ClinicFormCubit, ClinicFormState>(
    builder: (context, state) {
      if (state.location == null || !state.isUserSelection) {
        return const SizedBox.shrink();
      }
      return Btn(
        onPressed: () => context.pop(),
        text: LocaleKeys.clinic_form_confirm.tr(),
      );
    },
  );
}

class AddClinicMap extends StatelessWidget {
  const AddClinicMap({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicFormCubit>();
    return BlocBuilder<ClinicFormCubit, ClinicFormState>(
      builder: (context, state) {
        return state.location != null
            ? FlutterMap(
                mapController: cubit.mapController,
                options: MapOptions(
                  initialCenter: state.location!,
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
                        point: state.location!,
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
