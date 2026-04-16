import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/change_password/change_password_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Change Password'),
      body: ChangePasswordBody(),
    );
  }
}
