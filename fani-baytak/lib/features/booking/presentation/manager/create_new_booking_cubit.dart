import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/booking_model.dart';
import '../../domain/usecases/create_new_booking_use_case.dart';

part 'create_new_booking_state.dart';

@injectable
class CreateNewBookingCubit extends Cubit<CreateNewBookingState> {
  CreateNewBookingCubit(
    this._createNewBookingUseCase,
  ) : super(CreateNewBookingInitial());

  final CreateNewBookingUseCase _createNewBookingUseCase;
  static CreateNewBookingCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createNewBooking({
    required BookingModel bookingModel,
  }) async {
    emit(CreateNewBookingLoadingState());
    (await _createNewBookingUseCase(bookingModel: bookingModel)).fold(
      (l) => emit(CreateNewBookingErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateNewBookingSuccessState(),
      ),
    );
  }
}
