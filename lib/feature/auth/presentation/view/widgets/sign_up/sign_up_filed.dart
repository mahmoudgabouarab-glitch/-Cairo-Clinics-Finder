import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class SignUpFiled extends StatelessWidget {
  const SignUpFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(40),
        CustomTextFormFiled(hint: "Name", prefixIcon: Icons.person),
        spaceH(16),
        CustomTextFormFiled(hint: "Email", prefixIcon: Icons.email_outlined),
        spaceH(16),
        CustomTextFormFiled(
          hint: "Password",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
        ),
        spaceH(16),
        CustomTextFormFiled(
          hint: "Confirm Password",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
        ),

        spaceH(32),
      ],
    );
  }
}
