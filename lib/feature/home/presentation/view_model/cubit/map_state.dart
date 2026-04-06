part of 'map_cubit.dart';

class MapState extends Equatable {
  final LatLng? userLocation;
  final List<ClinicModel> clinics;
  final String selectedCategory;
  final ClinicModel? selectedClinic;
  final bool isLoading;
  final String? error;

  const MapState({
    this.userLocation,
    this.clinics = const [],
    this.selectedCategory = 'all',
    this.selectedClinic,
    this.isLoading = false,
    this.error,
  });

  List<ClinicModel> get filteredClinics => selectedCategory == 'all'
      ? clinics
      : clinics.where((item) => item.category == selectedCategory).toList();

  MapState copyWith({
    LatLng? userLocation,
    List<ClinicModel>? clinics,
    String? selectedCategory,
    ClinicModel? selectedClinic,
    bool? isLoading,
    String? error,
    bool clearSelected = false,
    bool clearError = false,
  }) {
    return MapState(
      userLocation: userLocation ?? this.userLocation,
      clinics: clinics ?? this.clinics,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedClinic: clearSelected
          ? null
          : selectedClinic ?? this.selectedClinic,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    userLocation,
    clinics,
    selectedCategory,
    selectedClinic,
    isLoading,
    error,
  ];
}
