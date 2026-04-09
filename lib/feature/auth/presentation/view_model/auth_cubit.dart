import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo) : super(AuthInitial());
  final AuthRepo _repo;
  final TextEditingController emailControllerSignUp = .new();
  final TextEditingController passwordControllerSignUp = .new();
  final TextEditingController nameControllerSignUp = .new();
  final TextEditingController phoneControllerSignUp = .new();
  final TextEditingController emailControllerSignIn = .new();
  final TextEditingController passwordControllerSignIn = .new();

  Future<void> signIn() async {
    emit(AuthLoading());
    final result = await _repo.signIn(
      email: emailControllerSignIn.text,
      password: passwordControllerSignIn.text,
    );
    result.fold(
      (faliure) => emit(AuthFailure(faliure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }

  Future<void> signUp() async {
    emit(AuthLoading());
    final result = await _repo.signUp(
      email: emailControllerSignUp.text,
      password: passwordControllerSignUp.text,
      name: nameControllerSignUp.text,
      phone: phoneControllerSignUp.text,
    );
    result.fold(
      (faliure) => emit(AuthFailure(faliure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    await _repo.signOut();
    emit(AuthInitial());
  }

  @override
  Future<void> close() {
    emailControllerSignUp.dispose();
    passwordControllerSignUp.dispose();
    nameControllerSignUp.dispose();
    phoneControllerSignUp.dispose();
    emailControllerSignIn.dispose();
    passwordControllerSignIn.dispose();
    return super.close();
  }
}
