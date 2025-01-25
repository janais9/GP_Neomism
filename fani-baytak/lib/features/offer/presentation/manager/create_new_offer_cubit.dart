import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

import '../../domain/usecases/create_new_offer_use_case.dart';

part 'create_new_offer_state.dart';

@injectable
class CreateNewOfferCubit extends Cubit<CreateNewOfferState> {
  CreateNewOfferCubit(
    this._createNewOfferUseCase,
  ) : super(CreateNewOfferInitial());

  final CreateNewOfferUseCase _createNewOfferUseCase;
  static CreateNewOfferCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createNewOffer({
    required OfferModel offerModel,
  }) async {
    emit(CreateNewOfferLoadingState());
    (await _createNewOfferUseCase(offerModel: offerModel)).fold(
      (l) => emit(CreateNewOfferErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateNewOfferSuccessState(),
      ),
    );
  }
}
