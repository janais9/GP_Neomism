import '../../domain/entities/chat_message_entity.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatMessageEntity> messages;

  ChatLoaded(this.messages);
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}
