part of 'add_clinic_cubit.dart';

sealed class AddClinicState extends Equatable {
  const AddClinicState();

  @override
  List<Object> get props => [];
}

final class AddClinicInitial extends AddClinicState {}

final class AddClinicLoading extends AddClinicState {}

final class AddClinicSuccess extends AddClinicState {}

final class AddClinicFailure extends AddClinicState {
  final String message;
  const AddClinicFailure(this.message);

  @override
  List<Object> get props => [message];
}
