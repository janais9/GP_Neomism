part of 'delete_booking_cubit.dart';

abstract class DeleteBookingState {}

class DeleteBookingInitial extends DeleteBookingState {}

class DeleteBookingLoadingState extends DeleteBookingState {}

class DeleteBookingSuccessState extends DeleteBookingState {
  DeleteBookingSuccessState();
}

class DeleteBookingErrorState extends DeleteBookingState {
  final String errorMessage;

  DeleteBookingErrorState({required this.errorMessage});
}
