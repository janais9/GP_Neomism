import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/contact_us_entity.dart';
import '../../domain/repositories/contact_us_repo.dart';
import '../datasources/contact_us_remote_data_source.dart';
import '../models/contact_us_model.dart';

@Injectable(as: ContactUsRepo)
class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsRemoteDataSource _remoteDataSource;

  const ContactUsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ContactUsEntity>>> getContactUs() async {
    try {
      final response = await _remoteDataSource.getContactUs();
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> contactUs({
    required ContactUsModel contactModel,
  }) async {
    try {
      final response = await _remoteDataSource.contactUs(
        contactModel: contactModel,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
