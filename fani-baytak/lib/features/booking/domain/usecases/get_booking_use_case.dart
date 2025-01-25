import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/booking_entity.dart';
import '../repositories/booking_repo.dart';

@injectable
class GetBookingUseCase {
  final BookingRepo _repo;
  const GetBookingUseCase(
    this._repo,
  );

  Future<Either<Failure, List<BookingEntity>>> call() async {
    return await _repo.getBooking();
  }
}
