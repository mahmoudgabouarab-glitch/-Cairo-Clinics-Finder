import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._repo) : super(SignUpInitial());
  final AuthRepo _repo;
  final TextEditingController emailController = .new();
  final TextEditingController passwordController = .new();
  final TextEditingController nameController = .new();
  final TextEditingController phoneController = .new();
  final TextEditingController confirmPasswordController = .new();
  final GlobalKey<FormState> formKey = .new();
  Future<void> signUp() async {
    emit(SignUpLoading());
    final result = await _repo.signUp(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );
    result.fold(
      (faliure) => emit(SignUpFailure(faliure.message)),
      (success) => emit(SignUpSuccess(success)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
