import 'package:cairo_clinics_finder/core/utils/app_validator.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileFiled extends StatefulWidget {
  final UserModel userModel;
  const EditProfileFiled({super.key, required this.userModel});

  @override
  State<EditProfileFiled> createState() => _EditProfileFiledState();
}

class _EditProfileFiledState extends State<EditProfileFiled> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<EditProfileCubit>();
    cubit.nameController.text = widget.userModel.name;
    cubit.emailController.text = widget.userModel.email;
    cubit.phoneController.text = widget.userModel.phone;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return CustomCard(
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              LocaleKeys.edit_profile_personal_info.tr(),
              isSuperTitle: true,
            ),
            spaceH(16),
            _sectionTitle(LocaleKeys.edit_profile_name.tr()),
            spaceH(4),
            CustomTextFormFiled(
              hint: LocaleKeys.edit_profile_name.tr(),
              prefixIcon: Icons.person,
              controller: cubit.nameController,
              validator: AppValidator.nameValidator(),
            ),
            spaceH(12),
            _sectionTitle(LocaleKeys.edit_profile_email.tr()),
            spaceH(4),
            CustomTextFormFiled(
              hint: LocaleKeys.edit_profile_email.tr(),
              prefixIcon: Icons.email_outlined,
              readOnly: true,
              controller: cubit.emailController,
            ),
            spaceH(12),
            _sectionTitle(LocaleKeys.edit_profile_phone.tr()),
            spaceH(4),
            CustomTextFormFiled(
              hint: LocaleKeys.edit_profile_phone.tr(),
              prefixIcon: Icons.phone,
              controller: cubit.phoneController,
              validator: AppValidator.phoneValidator(),
              keybordtype: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sectionTitle(String title, {bool isSuperTitle = false}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: isSuperTitle ? 14.sp : 12.sp,
      fontWeight: isSuperTitle ? FontWeight.w600 : FontWeight.w500,
      color: isSuperTitle ? Colors.black87 : Colors.grey[700],
    ),
  );
}
