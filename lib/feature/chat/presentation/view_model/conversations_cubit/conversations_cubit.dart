import 'dart:async';

import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversations_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final ChatRepo _repo;
  StreamSubscription? _sub;
  StreamSubscription<User?>? _authSub;

  ConversationsCubit(this._repo) : super(ConversationsInitial()) {
    // (Re)subscribe whenever the signed-in user changes so the inbox and the
    // unread badge stay correct across login / logout.
    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _start();
      } else {
        _sub?.cancel();
        emit(ConversationsInitial());
      }
    });
  }

  void _start() {
    emit(ConversationsLoading());
    _sub?.cancel();
    _sub = _repo.getConversations().listen((result) {
      result.fold(
        (failure) => emit(ConversationsFailure(failure.message)),
        (conversations) => emit(ConversationsSuccess(conversations)),
      );
    });
  }

  /// Kept for callers that trigger a manual (re)load; the auth listener already
  /// drives the stream, so this just ensures it is running.
  void getConversations() {
    if (FirebaseAuth.instance.currentUser != null && _sub == null) _start();
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _authSub?.cancel();
    return super.close();
  }
}
