import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';

import '../../../../core/network/failure.dart';
import '../repo/chat_repo.dart';

@injectable
class GetAllChatUseCase {
  final ChatRepository repository;

  GetAllChatUseCase(this.repository);

  Future<Either<ServerFailure, List<UserEntity>>> call() {
    return repository.getAllChat();
  }
}
