import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/contact_us/data/models/contact_us_model.dart';

import '../../domain/usecases/contact_us_use_case.dart';

part 'contact_us_state.dart';

@injectable
class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(
    this._contactUsUseCase,
  ) : super(ContactUsInitial());

  final ContactUsUseCase _contactUsUseCase;
  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> contactUs({
    required ContactUsModel contactModel,
  }) async {
    emit(ContactUsLoadingState());
    (await _contactUsUseCase(contactModel: contactModel)).fold(
      (l) => emit(ContactUsErrorState(errorMessage: l.message)),
      (r) => emit(
        ContactUsSuccessState(),
      ),
    );
  }
}
