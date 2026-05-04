import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/clinic_theme.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/my_clinic/my_clinic_custom_btn_action.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/my_clinic_cubit/my_clinic_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class OneItemOfMyClinic extends StatelessWidget {
  final ClinicModel clinic;
  const OneItemOfMyClinic({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                _buildImage(clinic),
                spaceW(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(clinic.name, style: AppTextStyles.f14SemiBoldBlack),
                      spaceH(3),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F5EE),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'clinic_form.${clinic.category}'.tr(),
                          style: AppTextStyles.f10Black.copyWith(
                            color: const Color(0xFF085041),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      spaceH(4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12.sp),
                          spaceW(3),
                          Text(
                            clinic.ratingStats.average.toStringAsFixed(1),
                            style: AppTextStyles.f12Grey,
                          ),
                          spaceW(6),
                          Text('•', style: TextStyle(color: Colors.grey[300])),
                          spaceW(6),
                          Text(
                            '${clinic.price} EGP',
                            style: AppTextStyles.f13BoldPrimary.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1.5, color: Colors.grey[200]),
          Row(
            children: [
              MyClinicCustomBtnAction(
                icon: Icons.visibility_outlined,
                label: LocaleKeys.my_clinics_view.tr(),
                iconColor: AppColor.primary,
                bgColor: const Color(0xFFE1F5EE),
                labelColor: AppColor.primary,
                onTap: () =>
                    context.push(GoTo.details, extra: {'clinic': clinic}),
                showDivider: isArabic(context) ? false : true,
              ),
              MyClinicCustomBtnAction(
                icon: Icons.edit_outlined,
                label: LocaleKeys.my_clinics_edit.tr(),
                iconColor: AppColor.primary,
                bgColor: const Color(0xFFE1F5EE),
                labelColor: AppColor.primary,
                onTap: () =>
                    context.push(GoTo.addClinic, extra: {'clinic': clinic}),
                showDivider: true,
              ),
              MyClinicCustomBtnAction(
                icon: Icons.delete_outline,
                label: LocaleKeys.my_clinics_delete.tr(),
                iconColor: const Color(0xFFA32D2D),
                bgColor: const Color(0xFFFCEBEB),
                labelColor: const Color(0xFF791F1F),
                onTap: () =>
                    context.read<MyClinicCubit>().deleteMyClinic(clinic),
                showDivider: isArabic(context) ? true : false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildImage(ClinicModel clinic) {
  if (clinic.imageUrl != null) {
    return Container(
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
    );
  } else {
    return Container(
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
    );
  }
}

bool isArabic(BuildContext context) => context.locale.languageCode == 'ar';
