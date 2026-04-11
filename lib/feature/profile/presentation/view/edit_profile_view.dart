import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends StatelessWidget {
  final ProfileModel profileModel;
  const EditProfileView({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: EditProfileBody(profileModel: profileModel),
    );
  }
}
