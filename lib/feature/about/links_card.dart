import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksCard extends StatelessWidget {
  const LinksCard({super.key});

  static const _email = 'mahmoud.g.abouarab@icloud.com';
  static const _whatsapp = 'https://wa.me/+201028119897';
  static const _instagram = 'https://instagram.com';
  static const _twitter = 'https://twitter.com';
  static const _facebook = 'https://facebook.com';
  
  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Us', style: AppTextStyles.f14SemiBoldBlack),
          spaceH(12),
          _LinkRow(
            icon: FontAwesomeIcons.envelope,
            title: 'Email',
            onTap: () => _launch(_email),
          ),
          _LinkRow(
            icon: FontAwesomeIcons.facebookF,
            title: 'Facebook',
            onTap: () => _launch(_facebook),
          ),
          _LinkRow(
            icon: FontAwesomeIcons.whatsapp,
            title: 'WhatsApp',
            onTap: () => _launch(_whatsapp),
          ),
          _LinkRow(
            icon: FontAwesomeIcons.instagram,
            title: 'Instagram',
            onTap: () => _launch(_instagram),
          ),
          _LinkRow(
            icon: FontAwesomeIcons.xTwitter,
            title: 'Twitter',
            onTap: () => _launch(_twitter),
          ),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final FaIconData icon;
  final String title;
  final VoidCallback onTap;

  const _LinkRow({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: FaIcon(icon, color: AppColor.primary, size: 20.r),
      title: Text(title, style: AppTextStyles.f14MediumBlack),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20.r),
      onTap: onTap,
    );
  }
}
