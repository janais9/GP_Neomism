import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/offer_entity.dart';
import '../../domain/repositories/offer_repo.dart';
import '../datasources/offer_remote_data_source.dart';
import '../models/offer_model.dart';

@Injectable(as: OfferRepo)
class OfferRepoImpl implements OfferRepo {
  final OfferRemoteDataSource _remoteDataSource;

  const OfferRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffers({
    String categoryId = '',
  }) async {
    try {
      final response =
          await _remoteDataSource.getOffers(categoryId: categoryId);
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getRecommendedOffers() async {
    try {
      final response = await _remoteDataSource.getRecommendedOffers();
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewOffer({
    required OfferModel offerModel,
  }) async {
    try {
      final response = await _remoteDataSource.createNewOffer(
        offerModel: offerModel,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
