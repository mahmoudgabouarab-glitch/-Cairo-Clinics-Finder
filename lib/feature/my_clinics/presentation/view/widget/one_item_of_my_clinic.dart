import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OneItemOfMyClinic extends StatelessWidget {
  final ClinicModel clinic;
  const OneItemOfMyClinic({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          clinic.imageUrl != null
              ? Container(
                  width: 52.r,
                  height: 52.r,
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
                  width: 52.r,
                  height: 52.r,
                  decoration: BoxDecoration(
                    gradient: AppColor.detailsAppBar,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
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
                Text(clinic.address, style: AppTextStyles.f12Grey),
                spaceH(6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14.r),
                    spaceW(4),
                    Text(
                      clinic.ratingStats.average.toString(),
                      style: AppTextStyles.f12Grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[600]),
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'delete', child: Text('Delete')),
              PopupMenuItem(value: 'view', child: Text('View')),
            ],
            onSelected: (value) {},
          ),
        ],
      ),
    );
  }
}
