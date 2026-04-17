import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this._repo) : super(RatingInitial());
  final ClinicsRepo _repo;

  Future<void> getRatingUser({required String clinicId}) async {
    emit(RatingLoading());
    final result = await _repo.getRating(clinicId: clinicId);
    result.fold(
      (failure) => emit(RatingFailure(failure.message)),
      (success) => emit(RatingSuccess(ratingUser: success)),
    );
  }

  Future<void> addRating({
    required String clinicId,
    required double rating,
  }) async {
    emit(RatingLoading());
    final result = await _repo.addRating(clinicId: clinicId, rating: rating);
    result.fold((failure) => emit(RatingFailure(failure.message)), (success) {
      getRatingUser(clinicId: clinicId);
      emit(AddRatingSuccess());
    });
  }
}
