part of 'conversations_cubit.dart';

sealed class ConversationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConversationsInitial extends ConversationsState {}

class ConversationsLoading extends ConversationsState {}

class ConversationsSuccess extends ConversationsState {
  final List<ConversationModel> conversations;

  ConversationsSuccess(this.conversations);

  @override
  List<Object?> get props => [conversations];
}

class ConversationsFailure extends ConversationsState {
  final String message;

  ConversationsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
