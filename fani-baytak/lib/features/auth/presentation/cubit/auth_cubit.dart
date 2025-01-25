import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/features/auth/data/datasources/auth_service.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthService authService = AuthService();
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      UserModel userModel = await authService.loginUser(
        email: email,
        password: password,
      );
      log('userModeluserModel ${userModel.toJson()}');
      emit(LoginSuccessState(userModel: userModel));

      print("User registered successfully");
    } catch (e) {
      emit(LoginErrorState(errorMessage: e.toString()));

      print("Error registering user: $e");
    }
  }

  Future<void> register({
    required UserModel userModel,
    String? password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final user = await authService.registerUser(
        firstName: userModel.firstName,
        lastName: userModel.lastName,
        image: userModel.image,
        email: userModel.email,
        password: password,
        type: userModel.type, // or "admin" or "customer"
        mobileNumber: userModel.mobileNumber,
        gender: userModel.gender,
      );
      emit(RegisterSuccessState(userModel: user));

      print("User registered successfully");
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));

      print("Error registering user: $e");
    }
  }
}
