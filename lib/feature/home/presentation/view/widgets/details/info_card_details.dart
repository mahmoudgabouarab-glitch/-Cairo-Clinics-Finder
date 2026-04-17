import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_info_row.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/rating_info_row.dart';
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
            icon: Icons.category_outlined,
            label: 'Specialty',
            value: clinic.category,
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: clinic.address,
          ),
          _divider(),
          GestureDetector(
            onTap: () async =>
                await launchUrl(Uri.parse('https://wa.me/+2${clinic.phone}')),
            child: CustomInfoRow(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: clinic.phone,
              isLink: true,
            ),
          ),
          _divider(),
          CustomInfoRow(
            icon: Icons.access_time_outlined,
            label: 'Hours',
            value: clinic.hours,
          ),
          _divider(),
          RatingInfoRow(clinic: clinic),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 24.h, color: Colors.grey[200]);
}
