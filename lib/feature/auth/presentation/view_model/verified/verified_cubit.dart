import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verified_state.dart';

class VerifiedCubit extends Cubit<VerifiedState> {
  VerifiedCubit(this._repo) : super(VerifiedInitial());
  final AuthRepo _repo;

  Future<void> checkVerification() async {
    emit(VerifiedLoading());
    final isVerified = await _repo.isVerified();
    if (isVerified) {
      emit(VerifiedSuccess());
    } else {
      emit(VerifiedFailure());
    }
  }

  Future<void> resendVerificationEmail() async {
    emit(VerifiedLoading());
    final result = await _repo.resendVerificationEmail();
    result.fold(
      (_) => emit(VerifiedFailure()),
      (_) => emit(ResendVerifiedSuccess()),
    );
  }
}
