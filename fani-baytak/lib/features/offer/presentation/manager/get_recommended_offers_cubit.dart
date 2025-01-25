import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

import '../../domain/usecases/get_recommended_offers_use_case.dart';

part 'get_recommended_offers_state.dart';

@injectable
class GetRecommendedCubit extends Cubit<GetRecommendedOffersState> {
  GetRecommendedCubit(
    this._getOfferUseCase,
  ) : super(GetRecommendedOffersInitial());

  final GetRecommendedOfferUseCase _getOfferUseCase;
  static GetRecommendedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getOffers() async {
    emit(GetRecommendedOffersLoadingState());
    (await _getOfferUseCase()).fold(
        (l) => emit(GetRecommendedOffersErrorState(errorMessage: l.message)),
        (r) => emit(GetRecommendedOffersSuccessState(offers: r)));
  }
}
