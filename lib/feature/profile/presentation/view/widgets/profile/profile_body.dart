import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/actions_card.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/info_card_profile.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  final ProfileModel profile;
  const ProfileBody({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProfileAppBar(state: profile),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                spaceH(16),
                InfoCardProfile(state: profile),
                spaceH(16),
                const ActionsCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
