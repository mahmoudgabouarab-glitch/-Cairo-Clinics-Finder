part of 'add_clinic_cubit.dart';

class AddClinicState extends Equatable {
  final String? error;
  final File? imageFile;
  final LatLng? location;
  final bool isUserSelection;
  final bool isLoading;
  final bool isSuccess;
  const AddClinicState({
    this.error,
    this.imageFile,
    this.location,
    this.isUserSelection = false,
    this.isLoading = false,
    this.isSuccess = false,
  });

  AddClinicState copyWith({
    String? error,
    File? imageFile,
    LatLng? location,
    bool? isUserSelection,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return AddClinicState(
      error: error ?? this.error,
      imageFile: imageFile ?? this.imageFile,
      location: location ?? this.location,
      isUserSelection: isUserSelection ?? this.isUserSelection,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    error,
    imageFile,
    location,
    isUserSelection,
    isLoading,
    isSuccess
  ];
}
