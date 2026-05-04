import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_info_row.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCardDetails extends StatelessWidget {
  final ClinicModel clinic;
  const InfoCardDetails({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          CustomInfoRow(
            icon: Icons.person,
            label: LocaleKeys.details_name.tr(),
            value: clinic.name,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.category_outlined,
            label: LocaleKeys.details_specialty.tr(),
            value: 'clinic_form.${clinic.category}'.tr(),
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.location_on_outlined,
            label: LocaleKeys.details_address.tr(),
            value: clinic.address,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.access_time_outlined,
            label: LocaleKeys.details_hours.tr(),
            value: clinic.hours,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.calendar_today_outlined,
            label: LocaleKeys.details_break_time.tr(),
            value: clinic.breakTime
                .split(', ')
                .map((d) => 'clinic_form.$d'.tr())
                .join(', '),
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.monetization_on_outlined,
            label: LocaleKeys.details_price.tr(),
            value: clinic.price,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.event_note_outlined,
            label: LocaleKeys.details_booking.tr(),
            value: 'clinic_form.${clinic.booking}'.tr(),
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.workspace_premium_outlined,
            label: LocaleKeys.details_degree.tr(),
            value: 'clinic_form.${clinic.degree}'.tr(),
          ),
          _divider(),
          GestureDetector(
            onTap: () async =>
                await launchUrl(Uri.parse('https://wa.me/+2${clinic.phone}')),
            child: CustomInfoRow(
              icon: Icons.phone_outlined,
              label: LocaleKeys.details_phone.tr(),
              value: clinic.phone,
              isLink: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 25.h, color: Colors.grey[200]);
}
