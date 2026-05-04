import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class OneItemOfFav extends StatelessWidget {
  final ClinicModel clinic;
  const OneItemOfFav({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(GoTo.details, extra: {"clinic": clinic}),
      child: CustomCard(
        child: Row(
          children: [
            clinic.imageUrl != null
                ? Container(
                    width: 54.r,
                    height: 54.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe0f2f1),
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(clinic.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: 54.r,
                    height: 54.r,
                    decoration: BoxDecoration(
                      gradient: AppColor.detailsAppBar,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: FaIcon(
                        ClinicTheme.markerIcon(clinic.category),
                        size: 24.sp,
                        color: Colors.white24,
                      ),
                    ),
                  ),
            spaceW(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(clinic.name, style: AppTextStyles.f14SemiBoldBlack),
                  spaceH(4),
                  Text(
                    '${'clinic_form.${clinic.category}'.tr()}• ${clinic.address}',
                    style: AppTextStyles.f12Grey,
                  ),
                  spaceH(4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14.r),
                      spaceW(4),
                      Text(
                        clinic.rating.toString(),
                        style: AppTextStyles.f12Grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<FavCubit>().toggleFavorite(clinic);
              },
              icon: Icon(Icons.favorite, color: AppColor.clinicRed, size: 22.r),
            ),
          ],
        ),
      ),
    );
  }
}
