part of 'clinic_form_cubit.dart';

class ClinicFormState extends Equatable {
  final String? error;
  final File? imageFile;
  final LatLng? location;
  final bool isUserSelection;
  final bool isLoading;
  final bool isSuccess;
  const ClinicFormState({
    this.error,
    this.imageFile,
    this.location,
    this.isUserSelection = false,
    this.isLoading = false,
    this.isSuccess = false,
  });

  ClinicFormState copyWith({
    String? error,
    File? imageFile,
    LatLng? location,
    bool? isUserSelection,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return ClinicFormState(
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
