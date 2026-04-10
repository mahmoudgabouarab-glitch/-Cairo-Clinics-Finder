import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/Auth_title.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/shared/auth_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Spacer(),
            const AuthIcon(icon: Icons.lock_reset_outlined),
            spaceH(32),
            const AuthTitle(title: "Forgot password?"),
            spaceH(12),
            _subtitle(),
            spaceH(40),
            CustomTextFormFiled(
              hint: "Email",
              prefixIcon: Icons.email_outlined,
            ),
            const Spacer(),
            Btn(onPressed: () {}, text: "Send reset link"),
            spaceH(32),
          ],
        ),
      ),
    );
  }
}

Widget _subtitle() {
  return Text(
    "Enter your email and we'll send you a reset link",
    style: TextStyle(fontSize: 14.sp, color: Colors.grey[500], height: 1.6),
  );
}
