import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';
import 'package:neomsim/features/chat/domain/entities/chat_message_entity.dart';

import '../../../../core/network/failure.dart';
import '../../domain/repo/chat_repo.dart';
import '../datasource/chat_remote_data_source.dart';
import '../model/chat_message_model.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<ChatMessageEntity>> getMessages(String? chatId) {
    return remoteDataSource.getMessages(chatId).map((models) {
      return models.map((model) {
        return ChatMessageEntity(
          id: model.id,
          senderId: model.senderId,
          message: model.message,
          timestamp: model.timestamp,
        );
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String? chatId, ChatMessageEntity message) async {
    final model = ChatMessageModel(
      id: message.id,
      senderId: message.senderId,
      message: message.message,
      timestamp: message.timestamp,
    );
    await remoteDataSource.sendMessage(chatId, model);
  }

  @override
  Future<Either<ServerFailure, List<UserEntity>>> getAllChat() async {
    try {
      List<UserModel> listModel = await remoteDataSource.getAllChat();
      return Right(listModel.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
