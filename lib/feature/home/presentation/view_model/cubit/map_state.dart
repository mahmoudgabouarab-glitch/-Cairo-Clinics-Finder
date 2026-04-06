part of 'map_cubit.dart';

class MapState extends Equatable {
  final LatLng? userLocation;
  final List<ClinicModel> clinics;
  final String selectedCategory;
  final ClinicModel? selectedClinic;
  final String searchQuery;
  final bool isLoading;
  final String? error;

  const MapState({
    this.userLocation,
    this.clinics = const [],
    this.selectedCategory = 'all',
    this.selectedClinic,
    this.searchQuery = '',
    this.isLoading = false,
    this.error,
  });

  List<ClinicModel> get filteredClinics {
    var result = selectedCategory == 'all'
        ? clinics
        : clinics.where((item) => item.category == selectedCategory).toList();
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      result = result
          .where(
            (item) =>
                item.name.toLowerCase().contains(query) ||
                item.category.toLowerCase().contains(query),
          )
          .toList();
    }
    return result;
  }

  MapState copyWith({
    LatLng? userLocation,
    List<ClinicModel>? clinics,
    String? selectedCategory,
    ClinicModel? selectedClinic,
    String? searchQuery,
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
      searchQuery: searchQuery ?? this.searchQuery,
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
    searchQuery,
    isLoading,
    error,
  ];
}
