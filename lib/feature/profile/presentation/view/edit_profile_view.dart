import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  final ProfileModel profileModel;
  const EditProfileView({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Edit Profile"),
      body: EditProfileBody(profileModel: profileModel),
    );
  }
}
