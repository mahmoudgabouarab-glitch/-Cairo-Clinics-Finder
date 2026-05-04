import 'dart:async';

import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/rating_cubit/rating_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingInfoRow extends StatefulWidget {
  final ClinicModel clinic;
  const RatingInfoRow({super.key, required this.clinic});

  @override
  State<RatingInfoRow> createState() => _RatingInfoRowState();
}

class _RatingInfoRowState extends State<RatingInfoRow> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {
        if (state is RatingFailure) {
          CustomSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        }
        if (state is AddRatingSuccess) {
          CustomSnackBar.show(
            context,
            message: LocaleKeys.details_added_success.tr(),
            type: SnackBarType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is RatingSuccess) {
          return CustomCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${LocaleKeys.details_your_rating.tr()} : ${state.ratingUser.rating}",
                  style: AppTextStyles.f14SemiBoldBlack,
                ),
                RatingBar.builder(
                  glowColor: Colors.amber,
                  initialRating: state.ratingUser.rating,
                  minRating: 1,
                  allowHalfRating: false,
                  direction: Axis.horizontal,
                  tapOnlyMode: true,
                  itemCount: 5,
                  itemSize: 24.r,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      context.read<RatingCubit>().addRating(
                        clinicId: widget.clinic.id,
                        rating: rating,
                      );
                    });
                  },
                ),
              ],
            ),
          );
        } else {
          return CustomLoading.linearLoading();
        }
      },
    );
  }
}
