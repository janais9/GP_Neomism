import 'package:injectable/injectable.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/category/domain/usecases/get_categories_use_case.dart';
import 'package:neomsim/my_app.dart';

import '../../domain/entities/category_entity.dart';

part 'get_category_state.dart';

@injectable
class GetCategoryCubit extends Cubit<GetCategoriesState> {
  GetCategoryCubit(
    this._authUseCase,
  ) : super(GetCategoriesInitial());

  final GetCategoriesUseCase _authUseCase;
  static GetCategoryCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getCategories({bool needShowAll = false}) async {
    emit(GetCategoriesLoadingState());
    (await _authUseCase()).fold(
        (l) => emit(GetCategoriesErrorState(errorMessage: l.message)), (r) {
      if (needShowAll) {
        r.insert(
          0,
          CategoryEntity(
            id: '',
            flag: '',
            name: navigatorKey.currentContext == null
                ? 'All'
                : S.of(navigatorKey.currentContext!).all,
          ),
        );
      }
      emit(GetCategoriesSuccessState(categories: r));
    });
  }
}
