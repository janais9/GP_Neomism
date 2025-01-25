part of 'get_offers_cubit.dart';

abstract class GetBookingsState {}

class GetBookingsInitial extends GetBookingsState {}

class GetBookingsLoadingState extends GetBookingsState {}

class GetBookingsSuccessState extends GetBookingsState {
  final List<BookingEntity> offers;

  GetBookingsSuccessState({required this.offers});
}

class GetBookingsErrorState extends GetBookingsState {
  final String errorMessage;

  GetBookingsErrorState({required this.errorMessage});
}
