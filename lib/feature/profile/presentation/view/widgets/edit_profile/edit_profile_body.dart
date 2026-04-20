import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_avatar.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_filed.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view/widgets/edit_profile/edit_profile_listener.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileBody extends StatelessWidget {
  final UserModel userModel;
  const EditProfileBody({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          EditProfileAvatar(userModel: userModel),
          spaceH(32),
          EditProfileFiled(userModel: userModel),
          spaceH(32),
          Btn(
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.editProfile();
              }
            },
            text: "Save changes",
          ),
          const EditProfileListener(),
        ],
      ),
    );
  }
}
