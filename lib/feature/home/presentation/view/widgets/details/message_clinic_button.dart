import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MessageClinicButton extends StatelessWidget {
  final ClinicModel clinic;
  const MessageClinicButton({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    final myId = getIt<FirebaseAuth>().currentUser?.uid;
    if (clinic.ownerId.isEmpty || clinic.ownerId == myId) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: OutlinedButton.icon(
        onPressed: () => context.push(GoTo.chat, extra: {'clinic': clinic}),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary,
          side: const BorderSide(color: AppColor.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        icon: Icon(Icons.chat_bubble_outline, size: 18.sp),
        label: Text(
          LocaleKeys.chat_message_clinic.tr(),
          style: AppTextStyles.f15BoldPrimary,
        ),
      ),
    );
  }
}
