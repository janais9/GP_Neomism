import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

class BookingEntity {
  final String id;
  final String userId, offerId, payMethod;
  final DateTime? dateFrom, dateTo, date;
  final OfferEntity? offerEntity;
  final double? adultNumber, roomNumber, price;

  BookingEntity({
    required this.dateTo,
    required this.dateFrom,
    required this.date,
    required this.id,
    required this.offerId,
    required this.payMethod,
    required this.userId,
    required this.offerEntity,
    required this.adultNumber,
    required this.price,
    required this.roomNumber,
  });
}
