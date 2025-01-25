import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/booking_entity.dart';
import '../../domain/usecases/get_booking_use_case.dart';

part 'get_booking_state.dart';

@injectable
class GetBookingsCubit extends Cubit<GetBookingsState> {
  GetBookingsCubit(
    this._getBookingUseCase,
  ) : super(GetBookingsInitial());

  final GetBookingUseCase _getBookingUseCase;
  static GetBookingsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getBooking() async {
    emit(GetBookingsLoadingState());
    (await _getBookingUseCase()).fold(
        (l) => emit(GetBookingsErrorState(errorMessage: l.message)),
        (r) => emit(GetBookingsSuccessState(offers: r)));
  }
}
