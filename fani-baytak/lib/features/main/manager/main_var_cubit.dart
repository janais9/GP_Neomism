import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/features/chat/presentation/pages/get_all_chat_screen.dart';
import 'package:neomsim/features/profile/presentation/pages/profile_screen.dart';
import '../../category/presentation/pages/category_screen.dart';
import '../../chat/presentation/pages/chat_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
import 'main_var_state.dart';

class MainVarCubit extends Cubit<MainVarState> {
  MainVarCubit() : super(MainVarInitState());

  static MainVarCubit get(BuildContext context) => BlocProvider.of(context);

  static int currentIndex = 0;

  List<Widget> screen() => [
        const HomeScreen(),
        const CategoryScreen(),
        if (isAdmin()) ...[
          const GetAllChatScreen(),
        ] else ...[
          const ChatScreen(),
        ],
        ProfileScreen(),
      ];
  void changeCurrentIndex({required int index}) {
    currentIndex = index;
    emit(MainVarChangeCurrentIndexState());
  }
}
