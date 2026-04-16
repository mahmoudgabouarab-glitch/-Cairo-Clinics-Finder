import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortClinics extends StatelessWidget {
  const SortClinics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Clinics ${state.filteredClinics.length}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<SortBy>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.cardBg,
                  focusedBorder: _border(),
                  border: _border(),
                  enabledBorder: _border(),
                ),
                dropdownColor: AppColor.cardBg,
                borderRadius: BorderRadius.circular(14.r),
                icon: const Icon(Icons.keyboard_arrow_down),
                menuMaxHeight: 200.h,
                initialValue: state.sortBy,
                items: const [
                  DropdownMenuItem(
                    value: SortBy.normal,
                    child: Text('Default'),
                  ),
                  DropdownMenuItem(
                    value: SortBy.nearest,
                    child: Text('Nearest'),
                  ),
                  DropdownMenuItem(value: SortBy.isOpen, child: Text('Open')),
                  DropdownMenuItem(value: SortBy.rating, child: Text('Rating')),
                  DropdownMenuItem(
                    value: SortBy.reviewCount,
                    child: Text('Reviews'),
                  ),
                  DropdownMenuItem(value: SortBy.name, child: Text('Name')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<MapCubit>().sortClinics(value);
                  }
                },
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: IconButton(
            //     onPressed: () async {
            //       final out = getIt<AuthRepo>();
            //       await out.signOut();
            //       context.pushReplacement(GoTo.onBording);
            //     },
            //     icon: Icon(Icons.logout, color: AppColor.primary),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

OutlineInputBorder _border() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
  );
}
