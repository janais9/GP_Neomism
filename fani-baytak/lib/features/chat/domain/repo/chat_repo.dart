import 'package:dartz/dartz.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';

import '../../../../core/network/failure.dart';
import '../entities/chat_message_entity.dart';

abstract class ChatRepository {
  Stream<List<ChatMessageEntity>> getMessages(String? chatId);
  Future<void> sendMessage(String? chatId, ChatMessageEntity message);
  Future<Either<ServerFailure, List<UserEntity>>> getAllChat();
}
