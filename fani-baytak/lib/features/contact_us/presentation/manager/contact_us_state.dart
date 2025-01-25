part of 'contact_us_cubit.dart';

abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {
  ContactUsSuccessState();
}

class ContactUsErrorState extends ContactUsState {
  final String errorMessage;

  ContactUsErrorState({required this.errorMessage});
}
