part of 'create_new_booking_cubit.dart';

abstract class CreateNewBookingState {}

class CreateNewBookingInitial extends CreateNewBookingState {}

class CreateNewBookingLoadingState extends CreateNewBookingState {}

class CreateNewBookingSuccessState extends CreateNewBookingState {
  CreateNewBookingSuccessState();
}

class CreateNewBookingErrorState extends CreateNewBookingState {
  final String errorMessage;

  CreateNewBookingErrorState({required this.errorMessage});
}
