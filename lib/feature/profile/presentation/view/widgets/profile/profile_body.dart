import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/actions_card.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/info_card_profile.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/profile_app_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileInitial():
            return const SizedBox.shrink();
          case ProfileLoading():
            return Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            );
          case ProfileSuccess():
            return CustomScrollView(
              slivers: [
                ProfileAppBar(state: state.profile),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        spaceH(16),
                        InfoCardProfile(state: state.profile),
                        spaceH(16),
                        ActionsCard(profileModel: state.profile),
                      ],
                    ),
                  ),
                ),
              ],
            );
          case ProfileFailure():
            return Center(child: Text(state.message));
        }
      },
    );
  }
}
