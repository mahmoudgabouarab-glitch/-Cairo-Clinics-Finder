import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/about/about_app_bar.dart';
import 'package:cairo_clinics_finder/feature/about/about_card.dart';
import 'package:cairo_clinics_finder/feature/about/links_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AboutAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [const AboutCard(), spaceH(16), const LinksCard()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
