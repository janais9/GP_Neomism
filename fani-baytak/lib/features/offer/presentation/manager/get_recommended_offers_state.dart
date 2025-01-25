part of 'get_recommended_offers_cubit.dart';

abstract class GetRecommendedOffersState {}

class GetRecommendedOffersInitial extends GetRecommendedOffersState {}

class GetRecommendedOffersLoadingState extends GetRecommendedOffersState {}

class GetRecommendedOffersSuccessState extends GetRecommendedOffersState {
  final List<OfferEntity> offers;

  GetRecommendedOffersSuccessState({required this.offers});
}

class GetRecommendedOffersErrorState extends GetRecommendedOffersState {
  final String errorMessage;

  GetRecommendedOffersErrorState({required this.errorMessage});
}
