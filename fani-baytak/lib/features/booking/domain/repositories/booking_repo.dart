import 'package:dartz/dartz.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/booking_model.dart';
import '../entities/booking_entity.dart';

abstract class BookingRepo {
  Future<Either<Failure, List<BookingEntity>>> getBooking();
  Future<Either<Failure, bool>> createNewBooking({
    required BookingModel bookingModel,
  });
  Future<Either<Failure, bool>> deleteBooking({
    required String bookingId,
  });
}
