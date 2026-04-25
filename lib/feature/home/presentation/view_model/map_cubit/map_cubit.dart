import 'dart:async';

import 'package:cairo_clinics_finder/core/network/location_helper.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._repo) : super(const MapState());
  final ClinicsRepo _repo;
  final MapController controller = MapController();
  StreamSubscription? _subscription;
  // this fun to #get clinics
  Future<void> getMap() async {
    if (state.clinics.isNotEmpty) return;
    emit(state.copyWith(isLoading: true));
    final userLocation = await LocationHelper.getUserLocation();
    _subscription = _repo.getClinics().listen((result) {
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
    });
  }

  // this fun to #sort clinics
  void sortClinics(SortBy sortBy) {
    final sorted = List.of(state.clinics);
    switch (sortBy) {
      case SortBy.rating:
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortBy.reviewCount:
        sorted.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      case SortBy.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortBy.nearest:
        if (state.userLocation != null) {
          const distance = Distance();
          sorted.sort((a, b) {
            final distA = distance.as(
              LengthUnit.Kilometer,
              state.userLocation!,
              LatLng(a.lat, a.lng),
            );
            final distB = distance.as(
              LengthUnit.Kilometer,
              state.userLocation!,
              LatLng(b.lat, b.lng),
            );
            return distA.compareTo(distB);
          });
        }
        break;
      case SortBy.isOpen:
        sorted.sort((a, b) {
          if (a.isOpen && !b.isOpen) return -1;
          if (!a.isOpen && b.isOpen) return 1;
          return 0;
        });
        break;
      case SortBy.price:
        sorted.sort((a, b) => a.price.compareTo(b.price));
      case SortBy.normal:
        break;
    }
    emit(state.copyWith(clinics: sorted, sortBy: sortBy));
  }

  // this fun to #search clinics
  void onSearchChanged(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  // this fun to #select category
  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  // this fun to #go to my location
  void goToMyLocation() {
    controller.move(state.userLocation!, 18);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    controller.dispose();
    return super.close();
  }
}
