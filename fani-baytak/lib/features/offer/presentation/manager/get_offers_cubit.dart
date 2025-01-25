import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

import '../../domain/usecases/get_offers_use_case.dart';

part 'get_offers_state.dart';

@injectable
class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(
    this._getOfferUseCase,
  ) : super(GetOffersInitial());

  final GetOfferUseCase _getOfferUseCase;
  static GetOffersCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getOffers({
    String categoryId = '',
  }) async {
    emit(GetOffersLoadingState());
    (await _getOfferUseCase(categoryId: categoryId)).fold(
        (l) => emit(GetOffersErrorState(errorMessage: l.message)),
        (r) => emit(GetOffersSuccessState(offers: r)));
  }
}
