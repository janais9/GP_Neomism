import 'package:neomsim/features/auth/data/models/user_model.dart';

import '../../domain/entities/contact_us_entity.dart';

class ContactUsModel {
  final String id, userId, email, subject, body;
  final UserModel? userModel;

  ContactUsModel({
    required this.body,
    required this.email,
    required this.id,
    required this.subject,
    required this.userId,
    this.userModel,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        body: json['body'] ?? '',
        email: json['email'] ?? '',
        id: json['id'] ?? '',
        subject: json['subject'] ?? '',
        userId: json['userId'] ?? '',
      );
  Map<String, dynamic> toMap() => {
        'body': body,
        'email': email,
        'subject': subject,
        'userId': userId,
      };
  ContactUsModel copyWith({
    String? id,
    String? userId,
    String? email,
    String? subject,
    String? body,
    UserModel? userModel,
  }) {
    return ContactUsModel(
      id: id ?? this.id,
      body: body ?? this.body,
      email: email ?? this.email,
      subject: subject ?? this.subject,
      userId: userId ?? this.userId,
      userModel: userModel ?? this.userModel,
    );
  }

  ContactUsEntity toEntity() => ContactUsEntity(
        body: body,
        email: email,
        id: id,
        subject: subject,
        userId: userId,
        userEntity: userModel?.toEntity(),
      );
}
