import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetailsAppBar extends StatelessWidget {
  final ClinicModel clinic;

  const DetailsAppBar({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.teal,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      actions: [
        BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            final isFav = context.read<FavCubit>().isFavorite(clinic.id);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<FavCubit>().toggleFavorite(clinic);
              },
            );
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: clinic.imageUrl != null
            ? CachedNetworkImage(
                imageUrl: clinic.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => CustomLoading.cupertinoLoading(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Container(
                decoration: const BoxDecoration(
                  gradient: AppColor.detailsAppBar,
                ),
                child: Center(
                  child: FaIcon(
                    ClinicTheme.markerIcon(clinic.category),
                    size: 80.sp,
                    color: Colors.white24,
                  ),
                ),
              ),
      ),
    );
  }
}
