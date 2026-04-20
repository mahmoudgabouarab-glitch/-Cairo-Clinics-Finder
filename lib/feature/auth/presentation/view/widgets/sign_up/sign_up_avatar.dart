import 'dart:io';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignUpAvatar extends StatelessWidget {
  const SignUpAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final picker = ImagePicker();
    return GestureDetector(
      onTap: () async {
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        cubit.pickImage(File(image.path));
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (prev, curr) => curr is SignUpPickImage,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 52.r,
                backgroundColor: const Color(0xFFe0f2f1),
                backgroundImage: cubit.imageFile != null
                    ? FileImage(cubit.imageFile!)
                    : null,
                child: cubit.imageFile == null
                    ? Icon(Icons.person, size: 52.r, color: Colors.teal)
                    : null,
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
