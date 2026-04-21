part of 'my_clinic_cubit.dart';

sealed class MyClinicState extends Equatable {
  const MyClinicState();

  @override
  List<Object> get props => [];
}

final class MyClinicInitial extends MyClinicState {}

final class MyClinicLoading extends MyClinicState {}

final class MyClinicSuccess extends MyClinicState {
  final List<ClinicModel> clinics;
  const MyClinicSuccess(this.clinics);

  @override
  List<Object> get props => [clinics];
}

final class MyClinicFailure extends MyClinicState {
  final String message;
  const MyClinicFailure(this.message);

  @override
  List<Object> get props => [message];
}
