import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/offer_entity.dart';
import '../repositories/offer_repo.dart';

@injectable
class GetOfferUseCase {
  final OfferRepo _repo;
  const GetOfferUseCase(
    this._repo,
  );

  Future<Either<Failure, List<OfferEntity>>> call({
    String categoryId = '',
  }) async {
    return await _repo.getOffers(categoryId: categoryId);
  }
}
