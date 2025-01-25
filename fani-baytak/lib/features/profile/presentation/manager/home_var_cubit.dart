import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_var_state.dart';

class HomeVarCubit extends Cubit<HomeVarState> {
  HomeVarCubit() : super(HomeVarInitState());

  static HomeVarCubit get(BuildContext context) => BlocProvider.of(context);

  bool isAvailable = true;

  void changeAvailable(bool value) {
    isAvailable = value;
    emit(HomeVarChangeTabState());
  }
}
