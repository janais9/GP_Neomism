part of 'create_new_offer_cubit.dart';

abstract class CreateNewOfferState {}

class CreateNewOfferInitial extends CreateNewOfferState {}

class CreateNewOfferLoadingState extends CreateNewOfferState {}

class CreateNewOfferSuccessState extends CreateNewOfferState {
  CreateNewOfferSuccessState();
}

class CreateNewOfferErrorState extends CreateNewOfferState {
  final String errorMessage;

  CreateNewOfferErrorState({required this.errorMessage});
}
