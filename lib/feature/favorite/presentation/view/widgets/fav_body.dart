import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view/widgets/one_item_of_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavBody extends StatelessWidget {
  const FavBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemCount: 5,
      separatorBuilder: (_, _) => spaceH(10),
      itemBuilder: (_, index) => OneItemOfFav(),
    );
  }
}
