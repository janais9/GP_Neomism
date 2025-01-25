import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

import '../../../../core/network/failure.dart';
import '../repositories/offer_repo.dart';

@injectable
class CreateNewOfferUseCase {
  final OfferRepo _repo;
  const CreateNewOfferUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({required OfferModel offerModel}) async {
    return await _repo.createNewOffer(offerModel: offerModel);
  }
}
