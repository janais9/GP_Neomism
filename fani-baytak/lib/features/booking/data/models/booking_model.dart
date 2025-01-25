import 'package:neomsim/features/booking/domain/entities/booking_entity.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

class BookingModel {
  final String id;
  final String userId, offerId, payMethod;
  final DateTime? dateFrom, dateTo, date;
  final OfferModel? offerModel;
  final double? adultNumber, roomNumber, price;

  BookingModel({
    required this.dateTo,
    required this.date,
    required this.dateFrom,
    required this.id,
    required this.offerId,
    required this.payMethod,
    required this.userId,
    required this.adultNumber,
    required this.price,
    required this.roomNumber,
    this.offerModel,
  });

  BookingModel copyWith({
    String? id,
    String? userId,
    String? offerId,
    String? payMethod,
    DateTime? dateFrom,
    DateTime? dateTo,
    DateTime? date,
    OfferModel? offerModel,
    double? adultNumber,
    double? roomNumber,
    double? price,
  }) =>
      BookingModel(
        dateTo: dateTo ?? this.dateTo,
        dateFrom: dateFrom ?? this.dateFrom,
        id: id ?? this.id,
        offerId: offerId ?? this.offerId,
        payMethod: payMethod ?? this.payMethod,
        userId: userId ?? this.userId,
        offerModel: offerModel ?? this.offerModel,
        price: price ?? this.price,
        roomNumber: roomNumber ?? this.roomNumber,
        adultNumber: adultNumber ?? this.adultNumber,
        date: date ?? this.date,
      );

  factory BookingModel.fromJson({
    required Map<String, dynamic> json,
  }) =>
      BookingModel(
        dateTo: json['dateTo'] == null
            ? null
            : DateTime.tryParse(json['dateTo'].toString()) ?? DateTime.now(),
        dateFrom: json['dateFrom'] == null
            ? null
            : DateTime.tryParse(json['dateFrom'].toString()) ?? DateTime.now(),
        date: json['date'] == null
            ? null
            : DateTime.tryParse(json['date'].toString()) ?? DateTime.now(),
        id: json['id'] ?? '',
        offerId: json['offerId'] ?? '',
        payMethod: json['payMethod'] ?? '',
        userId: json['userId'] ?? '',
        adultNumber: json['adultNumber'] ?? 0,
        price: json['price'] ?? 0,
        roomNumber: json['roomNumber'] ?? 0,
      );

  factory BookingModel.emptyOne() => BookingModel(
        dateTo: DateTime.now(),
        dateFrom: DateTime.now(),
        id: '',
        offerId: '',
        payMethod: '',
        userId: '',
        adultNumber: 0,
        price: 0,
        roomNumber: 0,
        date: DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        'dateTo': dateTo,
        'dateFrom': dateFrom,
        'offerId': offerId,
        'payMethod': payMethod,
        'userId': userId,
        'price': price,
        'roomNumber': roomNumber,
        'adultNumber': adultNumber,
        'date': date,
      };
  BookingEntity toEntity() => BookingEntity(
        dateTo: dateTo,
        dateFrom: dateFrom,
        date: date,
        id: id,
        offerId: offerId,
        payMethod: payMethod,
        userId: userId,
        adultNumber: adultNumber,
        price: price,
        roomNumber: roomNumber,
        offerEntity: offerModel?.toEntity(),
      );
}
