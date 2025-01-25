import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/offer_entity.dart';
import '../repositories/offer_repo.dart';

@injectable
class GetRecommendedOfferUseCase {
  final OfferRepo _repo;
  const GetRecommendedOfferUseCase(
    this._repo,
  );

  Future<Either<Failure, List<OfferEntity>>> call() async {
    return await _repo.getRecommendedOffers();
  }
}
