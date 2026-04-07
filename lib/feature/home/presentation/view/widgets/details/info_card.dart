import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCard extends StatelessWidget {
  final ClinicModel clinic;
  const InfoCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.category_outlined,
            label: 'Specialty',
            value: clinic.category,
          ),
          _divider(),
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: clinic.address,
          ),
          _divider(),
          GestureDetector(
            onTap: () async =>
                await launchUrl(Uri.parse('https://wa.me/+2${clinic.phone}')),
            child: _InfoRow(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: clinic.phone,
              isLink: true,
            ),
          ),
          _divider(),
          _InfoRow(
            icon: Icons.access_time_outlined,
            label: 'Hours',
            value: clinic.hours,
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(height: 24.h, color: Colors.grey[200]);
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLink;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20.sp, color: Colors.teal),
        spaceW(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey[500]),
              ),
              spaceH(2),
              Text(
                value,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        ...isLink
            ? [
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.openGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Call",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.openGreen,
                    ),
                  ),
                ),
              ]
            : [],
      ],
    );
  }
}
