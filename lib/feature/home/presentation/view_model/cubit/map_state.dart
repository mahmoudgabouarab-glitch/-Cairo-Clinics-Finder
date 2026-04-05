part of 'map_cubit.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

final class MapInitial extends MapState {}

final class MapLoading extends MapState {}

final class MapFailure extends MapState {
  final String message;
  const MapFailure(this.message);

  @override
  List<Object> get props => [message];
}

class MapSuccess extends MapState {
  final LatLng userLocation;
  final List<ClinicModel> clinics;
  final String selectedCategory;
  final ClinicModel? selectedClinic;

  const MapSuccess({
    required this.userLocation,
    required this.clinics,
    this.selectedCategory = 'all',
    this.selectedClinic,
  });

  List<ClinicModel> get 
  filteredClinics => selectedCategory == 'all'
      ? clinics
      : clinics.where((c) => c.category == selectedCategory).toList();

  MapSuccess copyWith({
    LatLng? userLocation,
    List<ClinicModel>? clinics,
    String? selectedCategory,
    ClinicModel? selectedClinic,
    bool clearSelected = false,
  }) {
    return MapSuccess(
      userLocation: userLocation ?? this.userLocation,
      clinics: clinics ?? this.clinics,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedClinic: clearSelected
          ? null
          : selectedClinic ?? this.selectedClinic,
    );
  }

  @override
  List<Object?> get props => [
    userLocation,
    clinics,
    selectedCategory,
    selectedClinic,
  ];
}
