import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/verified/resend_button.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/verified/verified_icon.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/verified/verified_subtitle.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/verified/verified_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifiedBody extends StatelessWidget {
  const VerifiedBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            const VerifiedIcon(),
            spaceH(32),
            const VerifiedTitle(),
            spaceH(12),
            VerifiedSubtitle(email: email),
            const Spacer(),
            Btn(onPressed: () {}, text: "I've verified, continue"),
            spaceH(12),
            ResendButton(onPressed: () {}),
            spaceH(32),
          ],
        ),
      ),
    );
  }
}
