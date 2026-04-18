import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/map_cubit/map_cubit.dart';
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
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Clinics ${state.filteredClinics.length}',
                style: AppTextStyles.f14SemiBoldBlack,
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
                items: sortItems
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.value,
                        child: _SortDropdownItem(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<MapCubit>().sortClinics(value);
                  }
                },
              ),
            ),
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

class SortItem {
  final SortBy value;
  final String label;
  final IconData icon;

  const SortItem(this.value, this.label, this.icon);
}

const List<SortItem> sortItems = [
  SortItem(SortBy.normal, 'Default', Icons.sort),
  SortItem(SortBy.nearest, 'Nearest', Icons.location_on_outlined),
  SortItem(SortBy.price, 'Price', Icons.attach_money_outlined),
  SortItem(SortBy.isOpen, 'Open Now', Icons.access_time),
  SortItem(SortBy.rating, 'Rating', Icons.star_outline),
  SortItem(SortBy.reviewCount, 'Reviews', Icons.rate_review_outlined),
  SortItem(SortBy.name, 'Name', Icons.sort_by_alpha),
];

class _SortDropdownItem extends StatelessWidget {
  final SortItem item;

  const _SortDropdownItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColor.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Icon(item.icon, size: 18.sp, color: AppColor.primary),
          ),
        ),
        spaceW(10),
        Text(item.label, style: AppTextStyles.f14MediumBlack),
      ],
    );
  }
}
