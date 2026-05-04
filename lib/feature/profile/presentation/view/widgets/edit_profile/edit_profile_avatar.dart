import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileAvatar extends StatelessWidget {
  final UserModel userModel;
  const EditProfileAvatar({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    final cubit = context.read<EditProfileCubit>();
    return GestureDetector(
      onTap: () async {
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        cubit.pickImage(File(image.path));
      },
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 48.r,
                backgroundColor: const Color(0xFFe0f2f1),
                backgroundImage: cubit.imageFile == null
                    ? CachedNetworkImageProvider(userModel.imageUrl)
                    : FileImage(cubit.imageFile!),
              ),
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.edit, color: Colors.white, size: 16.r),
              ),
            ],
          );
        },
      ),
    );
  }
}
