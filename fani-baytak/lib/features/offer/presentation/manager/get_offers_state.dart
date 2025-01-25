part of 'get_offers_cubit.dart';

abstract class GetOffersState {}

class GetOffersInitial extends GetOffersState {}

class GetOffersLoadingState extends GetOffersState {}

class GetOffersSuccessState extends GetOffersState {
  final List<OfferEntity> offers;

  GetOffersSuccessState({required this.offers});
}

class GetOffersErrorState extends GetOffersState {
  final String errorMessage;

  GetOffersErrorState({required this.errorMessage});
}
