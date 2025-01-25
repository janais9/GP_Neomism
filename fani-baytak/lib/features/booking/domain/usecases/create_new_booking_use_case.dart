import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/booking_model.dart';
import '../repositories/booking_repo.dart';

@injectable
class CreateNewBookingUseCase {
  final BookingRepo _repo;
  const CreateNewBookingUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call(
      {required BookingModel bookingModel}) async {
    return await _repo.createNewBooking(bookingModel: bookingModel);
  }
}
