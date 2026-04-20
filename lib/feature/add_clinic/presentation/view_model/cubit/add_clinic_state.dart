part of 'add_clinic_cubit.dart';

class AddClinicState extends Equatable {
  final String? error;
  final File? imageFile;
  final LatLng? location;
  final bool isUserSelection;
  final bool isLoading;
  const AddClinicState({
    this.error,
    this.imageFile,
    this.location,
    this.isUserSelection = false,
    this.isLoading = false,
  });

  AddClinicState copyWith({
    String? error,
    File? imageFile,
    LatLng? location,
    bool? isUserSelection,
    bool? isLoading,
  }) {
    return AddClinicState(
      error: error ?? this.error,
      imageFile: imageFile ?? this.imageFile,
      location: location ?? this.location,
      isUserSelection: isUserSelection ?? this.isUserSelection,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    error,
    imageFile,
    location,
    isUserSelection,
    isLoading,
  ];
}

// class AddClinicInitial extends AddClinicState {}

// class AddClinicLoading extends AddClinicState {}

// class AddClinicSuccess extends AddClinicState {}

// class AddClinicPickImage extends AddClinicState {
//   final File image;
//   AddClinicPickImage(this.image);

//   @override
//   List<Object?> get props => [image];
// }

// class AddClinicFailure extends AddClinicState {
//   final String message;
//   AddClinicFailure(this.message);

//   @override
//   List<Object?> get props => [message];
// }

// class AddClinicLocationLoaded extends AddClinicState {
//   final LatLng location;
//   final bool isUserSelection;
//   AddClinicLocationLoaded(this.location, {this.isUserSelection = false});

//   @override
//   List<Object?> get props => [location, isUserSelection];
// }
