part of 'map_cubit.dart';

class MapState extends Equatable {
  final LatLng? userLocation;
  final List<ClinicModel> clinics;
  final String selectedCategory;
  final String searchQuery;
  final SortBy sortBy;
  final bool isLoading;
  final String? error;

  const MapState({
    this.userLocation,
    this.clinics = const [],
    this.selectedCategory = 'all',
    this.searchQuery = '',
    this.sortBy = SortBy.normal,
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
    String? searchQuery,
    SortBy? sortBy,
    bool? isLoading,
    String? error,
  }) {
    return MapState(
      userLocation: userLocation ?? this.userLocation,
      clinics: clinics ?? this.clinics,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      sortBy: sortBy ?? this.sortBy,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    userLocation,
    clinics,
    selectedCategory,
    searchQuery,
    sortBy,
    isLoading,
    error,
  ];
}

enum SortBy { normal, rating, reviewCount, name, nearest, isOpen, price }
