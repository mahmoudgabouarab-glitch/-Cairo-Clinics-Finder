import 'package:cairo_clinics_finder/feature/profile/data/repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._repo) : super(ChangePasswordInitial());
  final ProfileRepo _repo;
  final TextEditingController oldPasswordController = .new();
  final TextEditingController newPasswordController = .new();
  final GlobalKey<FormState> formKey = .new();

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    final result = await _repo.changePassword(
      oldPassword: oldPasswordController.text,
      newPassword: newPasswordController.text,
    );
    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.message)),
      (success) => emit(ChangePasswordSuccess()),
    );
  }
}
