import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_title_icon.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view/widgets/one_item_of_fav.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavBody extends StatelessWidget {
  const FavBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        switch (state) {
          case FavInitial():
          case FavLoading():
            return const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            );
          case FavSuccess():
            if (state.clinics.isEmpty) return _buildEmptyFav();
            return ListView.separated(
              padding: EdgeInsets.all(16.r),
              itemCount: state.clinics.length,
              separatorBuilder: (_, _) => spaceH(10),
              itemBuilder: (_, index) =>
                  OneItemOfFav(clinic: state.clinics[index]),
            );
          case FavFailure():
            return Center(child: Text(state.message));
        }
      },
    );
  }
}

Widget _buildEmptyFav() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTitleIcon(
          icon: Icons.bookmark_border,
          height: 180,
          width: 180,
          size: 100,
        ),
        spaceH(12),
        Text(
          LocaleKeys.favorites_empty_title.tr(),
          style: AppTextStyles.f14SemiBoldBlack,
        ),
      ],
    ),
  );
}
