import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this._repo) : super(SignOutInitial());
  final AuthRepo _repo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await _repo.signOut();
    result.fold(
      (faliure) => emit(SignOutFailure(faliure.message)),
      (success) => emit(SignOutSuccess()),
    );
  }
}
