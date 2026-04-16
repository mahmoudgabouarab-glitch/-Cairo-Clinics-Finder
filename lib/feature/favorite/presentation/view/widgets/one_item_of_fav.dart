import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneItemOfFav extends StatelessWidget {
  final ClinicModel clinic;
  const OneItemOfFav({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: const Color(0xFFe0f2f1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.local_hospital_outlined,
              color: AppColor.primary,
              size: 26.r,
            ),
          ),
          spaceW(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinic.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                spaceH(4),
                Text(
                  '${clinic.category}• ${clinic.address}',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                ),
                spaceH(4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14.r),
                    spaceW(4),
                    Text(
                      clinic.rating.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
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
    );
  }
}
