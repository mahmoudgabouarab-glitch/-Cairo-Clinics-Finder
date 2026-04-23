import 'dart:io';

import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/add_clinic_cubit/add_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddClinicImageCard extends StatelessWidget {
  const AddClinicImageCard({super.key});

  static final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClinicCubit>();
    return BlocBuilder<AddClinicCubit, AddClinicState>(
      builder: (context, state) {
        final File? image = cubit.imageFile;
        return GestureDetector(
          onTap: () async {
            final picked = await _picker.pickImage(source: ImageSource.gallery);
            if (picked == null) return;
            cubit.pickImage(File(picked.path));
          },
          child: Container(
            width: double.infinity,
            height: 160.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5EE),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: image != null || cubit.oldImageUrl != null
                    ? const Color(0xFF1D9E75)
                    : const Color(0xFF5DCAA5),
                width: 1.5,
              ),
              image: image != null
                  ? DecorationImage(image: FileImage(image), fit: BoxFit.cover)
                  : cubit.oldImageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(cubit.oldImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: image == null && cubit.oldImageUrl == null
                ? Stack(
                    children: [
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 32.sp,
                              color: const Color(0xFF0F6E56),
                            ),
                            spaceW(14),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add clinic photo',
                                  style: AppTextStyles.f13BoldPrimary.copyWith(
                                    color: const Color(0xFF0F6E56),
                                  ),
                                ),
                                spaceH(4),
                                Text(
                                  'Tap to choose from gallery',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xFF5DCAA5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE1F5EE),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: const Color(0xFF5DCAA5),
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            'Optional',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF085041),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Container(
                        width: 28.r,
                        height: 28.r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF1D9E75),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 14.sp,
                          color: const Color(0xFF1D9E75),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
