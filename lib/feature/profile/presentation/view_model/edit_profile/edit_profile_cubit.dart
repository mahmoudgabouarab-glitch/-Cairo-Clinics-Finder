import 'dart:io';

import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/profile/data/repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._repo) : super(EditProfileInitial());
  final ProfileRepo _repo;
  final TextEditingController nameController = .new();
  final TextEditingController phoneController = .new();
  final TextEditingController emailController = .new();
  final GlobalKey<FormState> formKey = .new();

  File? imageFile;
  void pickImage(File image) {
    imageFile = image;
    emit(EditProfilePickImage(image));
  }

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    final result = await _repo.editProfile(
      name: nameController.text,
      phone: phoneController.text,
      image: imageFile,
    );
    result.fold(
      (failure) => emit(EditProfileFailure(failure.message)),
      (success) => emit(EditProfileSuccess()),
    );
  }

  // EditProfileCubit
  bool hasChanges(UserModel original) {
    return nameController.text != original.name ||
        phoneController.text != original.phone ||
        imageFile != null;
  }
}
