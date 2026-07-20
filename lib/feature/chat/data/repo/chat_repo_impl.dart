import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/message_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/repo/chat_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ChatRepoImpl(this._firestore, this._auth);

  String get _uid => _auth.currentUser!.uid;

  CollectionReference<Map<String, dynamic>> get _conversations =>
      _firestore.collection('conversations');

  @override
  Future<Either<Failure, String>> openConversation(ClinicModel clinic) async {
    try {
      final conversationId = '${clinic.id}_$_uid';
      final docRef = _conversations.doc(conversationId);
      final snapshot = await docRef.get();

      if (!snapshot.exists) {
        final userDoc = await _firestore.collection('users').doc(_uid).get();
        final userData = userDoc.data() ?? {};

        final conversation = ConversationModel(
          id: conversationId,
          clinicId: clinic.id,
          clinicName: clinic.name,
          clinicImage: clinic.imageUrl,
          patientId: _uid,
          patientName: userData['name'] as String? ?? '',
          patientImage: userData['imageUrl'] as String?,
          ownerId: clinic.ownerId,
          participants: [_uid, clinic.ownerId],
          lastMessage: '',
          lastMessageTime: null,
        );
        await docRef.set(conversation.toMap());
      }
      return Right(conversationId);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ConversationModel>>> getConversations() {
    if (_auth.currentUser == null) {
      return Stream.value(const Right([]));
    }
    return _conversations
        .where('participants', arrayContains: _uid)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map((snapshot) {
          try {
            final conversations = snapshot.docs
                .map((doc) => ConversationModel.fromJson(doc.data(), doc.id))
                .toList();
            return Right<Failure, List<ConversationModel>>(conversations);
          } on FirebaseException catch (e) {
            return Left(FirestoreFailure.fromFirebase(e));
          } catch (e) {
            return Left(Failure(e.toString()));
          }
        });
  }

  @override
  Stream<Either<Failure, List<MessageModel>>> getMessages(
    String conversationId,
  ) {
    return _conversations
        .doc(conversationId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
          try {
            final messages = snapshot.docs
                .map((doc) => MessageModel.fromJson(doc.data(), doc.id))
                .toList();
            return Right<Failure, List<MessageModel>>(messages);
          } on FirebaseException catch (e) {
            return Left(FirestoreFailure.fromFirebase(e));
          } catch (e) {
            return Left(Failure(e.toString()));
          }
        });
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required String conversationId,
    required String text,
  }) async {
    try {
      final docRef = _conversations.doc(conversationId);
      final message = MessageModel(
        id: '',
        senderId: _uid,
        text: text,
        timestamp: DateTime.now(),
      );

      await docRef.collection('messages').add(message.toMap());
      await docRef.update({
        'lastMessage': text,
        'lastMessageTime': FieldValue.serverTimestamp(),
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
