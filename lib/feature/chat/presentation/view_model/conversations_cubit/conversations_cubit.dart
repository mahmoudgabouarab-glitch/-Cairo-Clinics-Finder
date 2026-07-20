import 'dart:async';

import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversations_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final ChatRepo _repo;
  StreamSubscription? _subscription;

  ConversationsCubit(this._repo) : super(ConversationsInitial());

  void getConversations() {
    emit(ConversationsLoading());
    _subscription = _repo.getConversations().listen((result) {
      result.fold(
        (failure) => emit(ConversationsFailure(failure.message)),
        (conversations) => emit(ConversationsSuccess(conversations)),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
