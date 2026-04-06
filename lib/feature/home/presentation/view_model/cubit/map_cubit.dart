import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._repo) : super(MapState());
  final ClinicsRepo _repo;
  static const _cairo = LatLng(30.0444, 31.2357);

  Future<LatLng> _getUserLocation() async {
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return _cairo;
      }
      final position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (_) {
      return _cairo;
    }
  }

  Future<void> getMap() async {
    if (state.clinics.isNotEmpty) return;
    emit(state.copyWith(isLoading: true));
    final result = await _repo.getClinics();
    final userLocation = await _getUserLocation();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (success) => emit(
        state.copyWith(
          isLoading: false,
          clinics: success,
          userLocation: userLocation,
        ),
      ),
    );
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category, clearSelected: true));
  }

  String get selectedCategory => state.selectedCategory;
  void selectClinic(ClinicModel clinic) {
    emit(state.copyWith(selectedClinic: clinic));
  }

  void clearSelectedClinic() {
    emit(state.copyWith(clearSelected: true));
  }
}
