import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._repo) : super(MapInitial());
  final ClinicsRepo _repo;
  static const _cairo = LatLng(30.0444, 31.2357);

  Future<LatLng> _getUserLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return _cairo;
    }
    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  Future<void> getMap() async {
    emit(MapLoading());
    final result = await _repo.getClinics();
    final userLocation = await _getUserLocation();
    result.fold(
      (failure) => emit(MapFailure(failure.message)),
      (success) =>
          emit(MapSuccess(userLocation: userLocation, clinics: success)),
    );
  }

  void selectCategory(String category) {
    if (state is! MapSuccess) return;
    final current = state as MapSuccess;
    emit(current.copyWith(selectedCategory: category, clearSelected: true));
  }

  void selectClinic(ClinicModel clinic) {
    if (state is! MapSuccess) return;
    final current = state as MapSuccess;
    emit(current.copyWith(selectedClinic: clinic));
  }

  void clearSelectedClinic() {
    if (state is! MapSuccess) return;
    final current = state as MapSuccess;
    emit(current.copyWith(clearSelected: true));
  }
}
