part of 'get_contact_us_cubit.dart';

abstract class GetContactUsState {}

class GetContactUsInitial extends GetContactUsState {}

class GetContactUsLoadingState extends GetContactUsState {}

class GetContactUsSuccessState extends GetContactUsState {
  final List<ContactUsEntity> contactUs;

  GetContactUsSuccessState({required this.contactUs});
}

class GetContactUsErrorState extends GetContactUsState {
  final String errorMessage;

  GetContactUsErrorState({required this.errorMessage});
}
