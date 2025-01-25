import 'dart:convert';

import '../../../../core/global_model/name_model.dart';
import '../../domain/entities/offer_entity.dart';

class OfferModel {
  final String id;
  final NameModel title, desc;
  final bool isRecommended;
  final String categoryId;
  final List<RateModel> rate;
  final String time;
  final double price;
  final String location;
  final bool needDateFromTo, needAdultCounter, needRoomCounter, needDate;
  final List<String> images;

  OfferModel({
    required this.title,
    required this.categoryId,
    required this.desc,
    required this.id,
    required this.isRecommended,
    required this.rate,
    required this.location,
    required this.needDateFromTo,
    required this.time,
    required this.images,
    required this.needAdultCounter,
    required this.needRoomCounter,
    required this.price,
    required this.needDate,
  });

  factory OfferModel.emptyOne() => OfferModel(
        title: NameModel.emptyOne(),
        categoryId: '',
        desc: NameModel.emptyOne(),
        id: '',
        isRecommended: false,
        rate: [],
        location: '',
        needDateFromTo: false,
        time: '',
        images: [],
        needAdultCounter: false,
        needRoomCounter: false,
        price: 0,
        needDate: false,
      );

  // Factory constructor to create an instance from JSON
  factory OfferModel.fromJson({required Map<String, dynamic> json}) {
    List<RateModel> list = [];
    if (json['rate'] != null && json['rate'] is List) {
      for (final element in json['rate']) {
        list.add(RateModel.fromJson(json: element));
      }
    }
    List<String> images = [];
    if (json['images'] != null &&
        jsonDecode(json['images'].toString()) is List) {
      List jsonList = jsonDecode(json['images'].toString());
      for (final element in jsonList) {
        images.add(element);
      }
    }
    return OfferModel(
      images: images,
      title: json['title'] == null
          ? NameModel.emptyOne()
          : NameModel.fromJson(json: json['title']),
      categoryId: json['categoryId'] ?? '',
      desc: json['desc'] == null
          ? NameModel.emptyOne()
          : NameModel.fromJson(json: json['desc']),
      id: json['id'] ?? '',
      needAdultCounter: json['needAdultCounter'] == null
          ? false
          : (bool.tryParse(json['needAdultCounter'].toString()) ?? false),
      needRoomCounter: json['needRoomCounter'] == null
          ? false
          : (bool.tryParse(json['needRoomCounter'].toString()) ?? false),
      isRecommended: json['isRecommended'] == null
          ? false
          : (bool.tryParse(json['isRecommended'].toString()) ?? false),
      rate: list,
      location: json['location'] ?? '',
      needDateFromTo: json['needDateFromTo'] == null
          ? false
          : (bool.tryParse(json['needDateFromTo'].toString()) ?? false),
      time: json['time'] ?? '',
      price: json['price'] ?? 0,
      needDate: json['needDate'] ?? false,
    );
  }

  // Convert to map
  Map<String, dynamic> toMap() => {
        'images': jsonEncode(images), // Serialize List<String> to a JSON string
        'time': time,
        'needDateFromTo': needDateFromTo,
        'location': location,
        'isRecommended': isRecommended,
        'desc': desc.toJson(),
        'title': title.toJson(),
        'categoryId': categoryId,
        'needAdultCounter': needAdultCounter,
        'needRoomCounter': needRoomCounter,
        'price': price,
        'needDate': needDate,
      };

  // Convert to entity
  OfferEntity toEntity() => OfferEntity(
        images: images,
        title: title.toEntity(),
        categoryId: categoryId,
        desc: desc.toEntity(),
        id: id,
        isRecommended: isRecommended,
        rate: rate.map((element) => element.toEntity()).toList(),
        location: location,
        needDateFromTo: needDateFromTo,
        time: time,
        needAdultCounter: needAdultCounter,
        needRoomCounter: needRoomCounter,
        price: price,
        needDate: needDate,
      );

  // CopyWith method for immutability
  OfferModel copyWith({
    String? id,
    NameModel? title,
    NameModel? desc,
    bool? isRecommended,
    String? categoryId,
    List<RateModel>? rate,
    String? time,
    String? location,
    bool? needDateFromTo,
    bool? needDate,
    bool? needRoomCounter,
    bool? needAdultCounter,
    double? price,
    List<String>? images,
  }) {
    return OfferModel(
      id: id ?? this.id,
      needDate: needDate ?? this.needDate,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      isRecommended: isRecommended ?? this.isRecommended,
      categoryId: categoryId ?? this.categoryId,
      rate: rate ?? this.rate,
      time: time ?? this.time,
      location: location ?? this.location,
      needDateFromTo: needDateFromTo ?? this.needDateFromTo,
      images: images ?? this.images,
      needAdultCounter: needAdultCounter ?? this.needAdultCounter,
      needRoomCounter: needRoomCounter ?? this.needRoomCounter,
      price: price ?? this.price,
    );
  }
}

class RateModel {
  final String id;
  final String userId;
  final String comment;
  final double rate;

  RateModel({
    required this.comment,
    required this.id,
    required this.rate,
    required this.userId,
  });

  factory RateModel.emptyOne() => RateModel(
        comment: '',
        id: '',
        rate: 0,
        userId: '',
      );

  // Factory constructor to create an instance from JSON
  factory RateModel.fromJson({required Map<String, dynamic> json}) => RateModel(
        comment: json['comment'] ?? '',
        id: json['id'] ?? '',
        rate: json['rate'] == null
            ? 0
            : (double.tryParse(json['rate'].toString()) ?? 0),
        userId: json['userId'] ?? '',
      );

  // Convert to map
  Map<String, dynamic> toMap() => {
        'comment': comment,
        'rate': rate,
        'userId': userId,
      };

  // Convert to entity
  RateEntity toEntity() => RateEntity(
        comment: comment,
        id: id,
        rate: rate,
        userId: userId,
      );

  // CopyWith method for immutability
  RateModel copyWith({
    String? id,
    String? userId,
    String? comment,
    double? rate,
  }) {
    return RateModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      comment: comment ?? this.comment,
      rate: rate ?? this.rate,
    );
  }
}
