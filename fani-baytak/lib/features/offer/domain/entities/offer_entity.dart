import '../../../../core/gloabal_entitiy/name_entity.dart';

class OfferEntity {
  final String id;
  final NameEntity title, desc;
  final bool isRecommended;
  final String categoryId;
  final List<RateEntity> rate;
  final String time;
  final String location;
  final bool needDateFromTo, needAdultCounter, needRoomCounter, needDate;
  final List<String> images;
  final double price;
  OfferEntity({
    required this.images,
    required this.title,
    required this.categoryId,
    required this.desc,
    required this.id,
    required this.isRecommended,
    required this.rate,
    required this.location,
    required this.needDateFromTo,
    required this.needAdultCounter,
    required this.needRoomCounter,
    required this.time,
    required this.price,
    required this.needDate,
  });
}

class RateEntity {
  final String id;
  final String userId;
  final String comment;
  final double rate;

  RateEntity({
    required this.comment,
    required this.id,
    required this.rate,
    required this.userId,
  });
}
