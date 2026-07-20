part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<MessageModel> messages;

  ChatSuccess(this.messages);

  @override
  List<Object?> get props => [messages];
}

class ChatFailure extends ChatState {
  final String message;

  ChatFailure(this.message);

  @override
  List<Object?> get props => [message];
}
