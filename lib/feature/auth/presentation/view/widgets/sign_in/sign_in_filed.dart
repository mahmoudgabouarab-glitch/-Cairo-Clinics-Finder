import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class SignInFiled extends StatelessWidget {
  const SignInFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(40),
        CustomTextFormFiled(
          hint: "@email.com",
          prefixIcon: Icons.email_outlined,
        ),
        spaceH(16),
        CustomTextFormFiled(
          hint: "Password",
          obscureText: true,
          prefixIcon: Icons.lock,
        ),
        spaceH(12),
      ],
    );
  }
}
