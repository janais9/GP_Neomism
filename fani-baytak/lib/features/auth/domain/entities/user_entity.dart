import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/my_app.dart';

class UserEntity {
  final String? id;
  final String firstName;
  final String lastName;
  final String? image;
  final String email;
  final UserType type; // admin, customer
  final String mobileNumber;
  final Gender gender; // male, female

  UserEntity({
    this.id,
    this.image,
    required this.email,
    required this.type,
    required this.mobileNumber,
    required this.gender,
    required this.firstName,
    required this.lastName,
  });
}

enum UserType {
  customer,
  admin,
}

extension UserTypeName on UserType {
  String get nameText {
    switch (this) {
      case UserType.customer:
        return S.of(navigatorKey.currentContext!).customer;
      case UserType.admin:
        return S.of(navigatorKey.currentContext!).admin;
      default:
        return S.of(navigatorKey.currentContext!).customer;
    }
  }
}

extension UserTypeId on UserType {
  String get id {
    switch (this) {
      case UserType.customer:
        return 'customer';
      case UserType.admin:
        return 'admin';
      default:
        return 'customer';
    }
  }
}

enum Gender {
  male,
  female,
}

extension GenderName on Gender {
  String get nameText {
    switch (this) {
      case Gender.male:
        return S.of(navigatorKey.currentContext!).male;
      case Gender.female:
        return S.of(navigatorKey.currentContext!).female;
      default:
        return S.of(navigatorKey.currentContext!).male;
    }
  }
}

enum UserStatus {
  active,
  inactive,
}
