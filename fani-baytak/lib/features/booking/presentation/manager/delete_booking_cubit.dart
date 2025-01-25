import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/delete_booking_use_case.dart';

part 'delete_booking_state.dart';

@injectable
class DeleteBookingCubit extends Cubit<DeleteBookingState> {
  DeleteBookingCubit(
    this._createNewBookingUseCase,
  ) : super(DeleteBookingInitial());

  final DeleteBookingUseCase _createNewBookingUseCase;
  static DeleteBookingCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> deleteBooking({
    required String bookingId,
  }) async {
    emit(DeleteBookingLoadingState());
    (await _createNewBookingUseCase(bookingId: bookingId)).fold(
      (l) => emit(DeleteBookingErrorState(errorMessage: l.message)),
      (r) => emit(
        DeleteBookingSuccessState(),
      ),
    );
  }
}
