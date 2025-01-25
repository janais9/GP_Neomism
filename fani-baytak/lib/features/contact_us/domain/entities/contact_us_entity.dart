import '../../../auth/domain/entities/user_entity.dart';

class ContactUsEntity {
  final String id, userId, email, subject, body;
  final UserEntity? userEntity;

  ContactUsEntity({
    required this.body,
    required this.email,
    required this.id,
    required this.subject,
    required this.userId,
    this.userEntity,
  });
}
