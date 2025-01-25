import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repo.dart';
import '../datasources/booking_remote_data_source.dart';
import '../models/booking_model.dart';

@Injectable(as: BookingRepo)
class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource _remoteDataSource;

  const BookingRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BookingEntity>>> getBooking() async {
    try {
      final response = await _remoteDataSource.getBooking();
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewBooking({
    required BookingModel bookingModel,
  }) async {
    try {
      final response = await _remoteDataSource.createNewBooking(
        bookingModel: bookingModel,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBooking({
    required String bookingId,
  }) async {
    try {
      final response = await _remoteDataSource.deleteBooking(
        bookingId: bookingId,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
