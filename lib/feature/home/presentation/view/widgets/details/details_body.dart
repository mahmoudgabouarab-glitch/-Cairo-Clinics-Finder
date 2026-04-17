import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/details_app_bar.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/info_card_details.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/rating_info_row.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBody extends StatelessWidget {
  final ClinicModel clinic;
  const DetailsBody({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        DetailsAppBar(clinic: clinic),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusCard(clinic: clinic),
                spaceH(12),
                InfoCardDetails(clinic: clinic),
                spaceH(12),
                RatingInfoRow(clinic: clinic),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
