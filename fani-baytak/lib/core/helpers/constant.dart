import 'package:neomsim/core/global_model/drop_down_model.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';

const int timerInSecond = 10 * 60; // 10 min * 60 sec = 600 sec in 10 min
const double passQuizScore = 0.70;

Map<String, UserType> stringToUserType = {
  UserType.customer.id: UserType.customer,
  UserType.admin.id: UserType.admin,
};
Map<String, Gender> stringToGender = {
  Gender.male.name: Gender.male,
  Gender.female.name: Gender.female,
};

List<DropDownModel> userTypes = [
  DropDownModel(
    id: UserType.customer.id,
    name: UserType.customer.nameText,
  ),
];

List<DropDownModel> genderList = [
  DropDownModel(
    id: Gender.male.name,
    name: Gender.male.nameText,
  ),
  DropDownModel(
    id: Gender.female.name,
    name: Gender.female.nameText,
  ),
];

const String chatCollection = 'chatRooms';
const String messageCollection = 'messages';
const String userCollection = 'users';
const String timestampField = 'timestamp';
