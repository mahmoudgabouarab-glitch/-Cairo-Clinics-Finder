part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavSuccess extends FavState {
  final List<ClinicModel> clinics;

  FavSuccess(this.clinics);

  @override
  List<Object?> get props => [clinics];
}

class FavFailure extends FavState {
  final String message;
  FavFailure(this.message);
  @override
  List<Object?> get props => [message];
}
