import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ConversationModel extends Equatable {
  final String id;
  final String clinicId;
  final String clinicName;
  final String? clinicImage;
  final String patientId;
  final String patientName;
  final String? patientImage;
  final String ownerId;
  final List<String> participants;
  final String lastMessage;
  final DateTime? lastMessageTime;

  /// Unread message count per participant uid.
  final Map<String, int> unread;

  const ConversationModel({
    required this.id,
    required this.clinicId,
    required this.clinicName,
    required this.clinicImage,
    required this.patientId,
    required this.patientName,
    required this.patientImage,
    required this.ownerId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unread = const {},
  });

  int unreadFor(String? uid) => uid == null ? 0 : (unread[uid] ?? 0);

  factory ConversationModel.fromJson(Map<String, dynamic> map, String id) {
    return ConversationModel(
      id: id,
      clinicId: map['clinicId'] as String? ?? '',
      clinicName: map['clinicName'] as String? ?? '',
      clinicImage: map['clinicImage'] as String?,
      patientId: map['patientId'] as String? ?? '',
      patientName: map['patientName'] as String? ?? '',
      patientImage: map['patientImage'] as String?,
      ownerId: map['ownerId'] as String? ?? '',
      participants:
          (map['participants'] as List?)?.map((e) => e.toString()).toList() ??
          const [],
      lastMessage: map['lastMessage'] as String? ?? '',
      lastMessageTime: (map['lastMessageTime'] as Timestamp?)?.toDate(),
      unread: (map['unread'] as Map?)?.map(
            (key, value) => MapEntry(key.toString(), (value as num?)?.toInt() ?? 0),
          ) ??
          const {},
    );
  }

  Map<String, dynamic> toMap() => {
    'clinicId': clinicId,
    'clinicName': clinicName,
    'clinicImage': clinicImage,
    'patientId': patientId,
    'patientName': patientName,
    'patientImage': patientImage,
    'ownerId': ownerId,
    'participants': participants,
    'lastMessage': lastMessage,
    'lastMessageTime': FieldValue.serverTimestamp(),
    'unread': {for (final p in participants) p: 0},
  };

  @override
  List<Object?> get props => [
    id,
    clinicId,
    clinicName,
    clinicImage,
    patientId,
    patientName,
    patientImage,
    ownerId,
    participants,
    lastMessage,
    lastMessageTime,
    unread,
  ];
}
