import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_text_filed.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileFiled extends StatefulWidget {
  final ProfileModel profileModel;
  const EditProfileFiled({super.key, required this.profileModel});

  @override
  State<EditProfileFiled> createState() => _EditProfileFiledState();
}

class _EditProfileFiledState extends State<EditProfileFiled> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<EditProfileCubit>();
    cubit.nameController.text = widget.profileModel.name;
    cubit.emailController.text = widget.profileModel.email;
    cubit.phoneController.text = widget.profileModel.phone;
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
            _sectionTitle('Personal Info', isSuperTitle: true),
            spaceH(16),
            _sectionTitle("Name"),
            spaceH(4),
            CustomTextFormFiled(
              hint: "Name",
              prefixIcon: Icons.person,
              controller: cubit.nameController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            spaceH(12),
            _sectionTitle("Email"),
            spaceH(4),
            CustomTextFormFiled(
              hint: "Email",
              prefixIcon: Icons.email_outlined,
              readOnly: true,
              controller: cubit.emailController,
            ),
            spaceH(12),
            _sectionTitle("phone"),
            spaceH(4),
            CustomTextFormFiled(
              hint: "phone",
              prefixIcon: Icons.phone,
              controller: cubit.phoneController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
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
