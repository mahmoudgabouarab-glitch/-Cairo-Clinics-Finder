import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversationsEmpty extends StatelessWidget {
  const ConversationsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.forum_outlined,
            size: 64.sp,
            color: AppColor.primary.shade200,
          ),
          spaceH(12),
          Text(
            LocaleKeys.chat_inbox_empty.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.f14Grey,
          ),
        ],
      ),
    );
  }
}
