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

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    final result = await _repo.editProfile(
      name: nameController.text,
      phone: phoneController.text,
    );
    result.fold(
      (failure) => emit(EditProfileFailure(failure.message)),
      (success) => emit(EditProfileSuccess()),
    );
  }
}
