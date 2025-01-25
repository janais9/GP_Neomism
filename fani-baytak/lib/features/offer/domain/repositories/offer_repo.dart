import 'package:dartz/dartz.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

import '../../../../core/network/failure.dart';

abstract class OfferRepo {
  Future<Either<Failure, List<OfferEntity>>> getOffers({
    String categoryId = '',
  });
  Future<Either<Failure, List<OfferEntity>>> getRecommendedOffers();
  Future<Either<Failure, bool>> createNewOffer({
    required OfferModel offerModel,
  });
}
