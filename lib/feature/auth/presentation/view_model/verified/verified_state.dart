part of 'verified_cubit.dart';

sealed class VerifiedState extends Equatable {
  const VerifiedState();

  @override
  List<Object> get props => [];
}

final class VerifiedInitial extends VerifiedState {}

final class VerifiedLoading extends VerifiedState {}

final class VerifiedSuccess extends VerifiedState {}

final class ResendVerifiedSuccess extends VerifiedState {
  final String message;
  const ResendVerifiedSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class VerifiedFailure extends VerifiedState {
  final String message;
  const VerifiedFailure(this.message);

  @override
  List<Object> get props => [message];
}
