import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/profile/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final ProfileModel profileModel;
  const ProfileView({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileBody(profile: profileModel));
  }
}
