import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._repo) : super(ForgetPasswordInitial());
  final AuthRepo _repo;
  final TextEditingController emailController = .new();
  final GlobalKey<FormState> formKey = .new();
  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());
    final result = await _repo.forgetPassword(email: emailController.text);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (success) => emit(ForgetPasswordSuccess()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
