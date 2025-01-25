import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/contact_us/domain/entities/contact_us_entity.dart';

import '../../domain/usecases/get_contact_us_use_case.dart';

part 'get_contact_us_state.dart';

@injectable
class GetContactUsCubit extends Cubit<GetContactUsState> {
  GetContactUsCubit(
    this._getContactUsUseCase,
  ) : super(GetContactUsInitial());

  final GetContactUsUseCase _getContactUsUseCase;
  static GetContactUsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getContactUss() async {
    emit(GetContactUsLoadingState());
    (await _getContactUsUseCase()).fold(
        (l) => emit(GetContactUsErrorState(errorMessage: l.message)),
        (r) => emit(GetContactUsSuccessState(contactUs: r)));
  }
}
