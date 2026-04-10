import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._repo) : super(SignInInitial());
  final AuthRepo _repo;
  final TextEditingController emailController = .new();
  final TextEditingController passwordController = .new();
  final GlobalKey<FormState> formKey = .new();

  Future<void> signIn() async {
    emit(SignInLoading());
    final result = await _repo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (faliure) => emit(SignInFailure(faliure.message)),
      (success) => emit(SignInSuccess(success)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
