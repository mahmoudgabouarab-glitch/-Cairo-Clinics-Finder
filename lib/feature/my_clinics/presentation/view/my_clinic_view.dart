import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/my_clinic/my_clinic_body.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyClinicsView extends StatelessWidget {
  const MyClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_clinics_title.tr()),
      body: const MyClinicBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(GoTo.addClinic, extra: {"clinic": null}),
        backgroundColor: AppColor.primary,
        icon: const Icon(Icons.add_business_outlined, color: Colors.white),
        label: Text(
          LocaleKeys.my_clinics_add.tr(),
          style: AppTextStyles.f14MediumWhite,
        ),
      ),
    );
  }
}
