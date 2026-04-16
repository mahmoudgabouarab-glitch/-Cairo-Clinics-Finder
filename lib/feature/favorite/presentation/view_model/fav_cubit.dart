import 'dart:async';
import 'package:cairo_clinics_finder/feature/favorite/data/repo/fav_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo _repo;
  StreamSubscription? _subscription;

  FavCubit(this._repo) : super(FavInitial());

  void getFav() {
    emit(FavLoading());
    _subscription = _repo.getFav().listen((result) {
      result.fold(
        (failure) => emit(FavFailure(failure.message)),
        (clinics) => emit(FavSuccess(clinics)),
      );
    });
  }

  Future<void> toggleFavorite(ClinicModel clinic) async {
    final current = state;
    if (current is! FavSuccess) return;

    final isFav = current.clinics.any((c) => c.id == clinic.id);
    if (isFav) {
      await _repo.removeFav(clinic.id);
    } else {
      await _repo.addFav(clinic);
    }
  }

  bool isFavorite(String clinicId) {
    final current = state;
    if (current is FavSuccess) {
      return current.clinics.any((c) => c.id == clinicId);
    }
    return false;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
