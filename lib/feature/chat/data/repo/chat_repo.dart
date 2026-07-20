import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/message_model.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> openConversation(ClinicModel clinic);

  Stream<Either<Failure, List<ConversationModel>>> getConversations();

  Stream<Either<Failure, List<MessageModel>>> getMessages(
    String conversationId,
  );

  Future<Either<Failure, void>> sendMessage({
    required String conversationId,
    required String text,
  });
}
