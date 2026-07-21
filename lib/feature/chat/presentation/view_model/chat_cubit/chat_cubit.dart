import 'dart:async';

import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/message_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/repo/chat_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  final ClinicModel? clinic;
  final ConversationModel? conversation;
  StreamSubscription? _subscription;
  String? _conversationId;

  ChatCubit(this._repo, {this.clinic, this.conversation})
    : assert(clinic != null || conversation != null),
      super(ChatInitial());

  String? get _myId => getIt<FirebaseAuth>().currentUser?.uid;

  String get _recipientId {
    final convo = conversation;
    if (convo != null) {
      return _myId == convo.patientId ? convo.ownerId : convo.patientId;
    }
    return clinic?.ownerId ?? '';
  }

  String get title {
    final convo = conversation;
    if (convo == null) return clinic?.name ?? '';
    final isPatient = _myId == convo.patientId;
    if (!isPatient && convo.patientName.isNotEmpty) return convo.patientName;
    return convo.clinicName;
  }

  Future<void> init() async {
    emit(ChatLoading());

    if (conversation != null) {
      _conversationId = conversation!.id;
      _repo.markAsRead(conversation!.id);
      _listenToMessages(conversation!.id);
      return;
    }

    final result = await _repo.openConversation(clinic!);
    result.fold((failure) => emit(ChatFailure(failure.message)), (id) {
      _conversationId = id;
      _repo.markAsRead(id);
      _listenToMessages(id);
    });
  }

  void _listenToMessages(String conversationId) {
    _subscription?.cancel();
    _subscription = _repo.getMessages(conversationId).listen((result) {
      result.fold((failure) => emit(ChatFailure(failure.message)), (messages) {
        emit(ChatSuccess(messages));
        if (messages.isNotEmpty && messages.last.senderId != _myId) {
          _repo.markAsRead(conversationId);
        }
      });
    });
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    final id = _conversationId;
    if (trimmed.isEmpty || id == null) return;
    await _repo.sendMessage(
      conversationId: id,
      text: trimmed,
      recipientId: _recipientId,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
