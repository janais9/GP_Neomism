import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/failure.dart';
import '../repositories/booking_repo.dart';

@injectable
class DeleteBookingUseCase {
  final BookingRepo _repo;
  const DeleteBookingUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({required String bookingId}) async {
    return await _repo.deleteBooking(bookingId: bookingId);
  }
}
