import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_body.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  final UserModel userModel;
  const EditProfileView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.edit_profile_title.tr()),
      body: EditProfileBody(userModel: userModel),
    );
  }
}
