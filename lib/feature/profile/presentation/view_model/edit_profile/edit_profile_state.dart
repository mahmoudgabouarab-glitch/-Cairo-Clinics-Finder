part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {}
final class EditProfilePickImage extends EditProfileState {
    final File imageFile;

 const EditProfilePickImage(this.imageFile);

}

final class EditProfileFailure extends EditProfileState {
  final String message;
  const EditProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}
