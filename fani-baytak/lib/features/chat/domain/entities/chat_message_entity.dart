class ChatMessageEntity {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;

  ChatMessageEntity({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
  });
}
