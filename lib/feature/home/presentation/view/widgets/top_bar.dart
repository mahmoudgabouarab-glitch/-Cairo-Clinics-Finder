import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/build_filter_chips.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/build_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BuildSearchBar(),
            spaceH(8),
            const BuildFilterChips(),
          ],
        ),
      ),
    );
  }
}
