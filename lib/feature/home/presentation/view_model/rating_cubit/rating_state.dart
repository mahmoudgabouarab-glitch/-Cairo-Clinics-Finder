part of 'rating_cubit.dart';

sealed class RatingState extends Equatable {
  const RatingState();

  @override
  List<Object> get props => [];
}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingSuccess extends RatingState {
  final RatingUser ratingUser;
  const RatingSuccess({required this.ratingUser});

  @override
  List<Object> get props => [];
}

final class RatingFailure extends RatingState {
  final String message;

  const RatingFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class AddRatingSuccess extends RatingState {}
