part of 'add_clinic_cubit.dart';

sealed class AddClinicState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddClinicInitial extends AddClinicState {}

class AddClinicLoading extends AddClinicState {}

class AddClinicSuccess extends AddClinicState {}

class AddClinicFailure extends AddClinicState {
  final String message;
  AddClinicFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AddClinicLocationLoaded extends AddClinicState {
  final LatLng location;
  final bool isUserSelection;
  AddClinicLocationLoaded(this.location, {this.isUserSelection = false});

  @override
  List<Object?> get props => [location, isUserSelection];
}
