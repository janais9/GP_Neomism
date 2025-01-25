import 'dart:developer';

import 'package:neomsim/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String? image;
  final String email;
  final UserType type; // admin, customer
  final String mobileNumber;
  final Gender gender; // male, female

  UserModel({
    this.id,
    this.image,
    required this.email,
    required this.type,
    required this.mobileNumber,
    required this.gender,
    required this.firstName,
    required this.lastName,
  });

  // Convert UserModel to Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      if (id?.isNotEmpty ?? false) 'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'image': image,
      'email': email,
      'type': type.name,
      'mobileNumber': mobileNumber,
      'gender': gender.name,
    };
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? id,
    String? image,
    String? email,
    UserType? type,
    String? mobileNumber,
    Gender? gender,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      id: id ?? this.id,
      image: image ?? this.image,
      email: email ?? this.email,
      type: type ?? this.type,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      gender: gender ?? this.gender,
    );
  }

  factory UserModel.emptyOne() => UserModel(
        firstName: '',
        lastName: '',
        email: '',
        id: '',
        type: UserType.customer,
        mobileNumber: '',
        gender: Gender.male,
        image: '',
      );

  // Create UserModel from Map (JSON)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserType type = UserType.customer;
    Gender gender = Gender.male;
    if (json['type'] != null) {
      String typeString = json['type'].toString();
      switch (typeString) {
        case 'customer':
          type = UserType.customer;
          break;
        case 'admin':
          type = UserType.admin;
          break;
        default:
          type = UserType.customer;
      }
    }

    if (json['gender'] != null) {
      String genderString = json['gender'].toString();
      switch (genderString) {
        case 'male':
          gender = Gender.male;
          break;
        case 'female':
          gender = Gender.female;
          break;
        default:
          gender = Gender.male;
      }
    }
    log("json['id'] ${json['id']}");
    return UserModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      type: type,
      mobileNumber: json['mobileNumber'] ?? '',
      gender: gender,
    );
  }
  UserEntity toEntity() => UserEntity(
        email: email,
        type: type,
        mobileNumber: mobileNumber,
        gender: gender,
        firstName: firstName,
        lastName: lastName,
        id: id,
      );
}
