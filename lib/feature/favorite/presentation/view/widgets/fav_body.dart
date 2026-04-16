import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view/widgets/one_item_of_fav.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
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
