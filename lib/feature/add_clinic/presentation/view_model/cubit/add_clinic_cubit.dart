import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_clinic_state.dart';

class AddClinicCubit extends Cubit<AddClinicState> {
  AddClinicCubit(this._repo) : super(AddClinicInitial());
  final AddClinicRepo _repo;

  Future<void> addClinic({
    required String name,
    required String category,
    required double lat,
    required double lng,
    required String phone,
    required String address,
    required double rating,
    required int reviewCount,
    required bool isOpen,
    required String hours,
  }) async {
    emit(AddClinicLoading());
    final result = await _repo.addClinic(
      name: name,
      category: category,
      lat: lat,
      lng: lng,
      phone: phone,
      address: address,
      rating: rating,
      reviewCount: reviewCount,
      isOpen: isOpen,
      hours: hours,
    );
    result.fold(
      (l) => emit(AddClinicFailure(l.message)),
      (r) => emit(AddClinicSuccess()),
    );
  }
}
