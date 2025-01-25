import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/home/presentation/manager/home_var_cubit.dart';
import 'package:neomsim/features/home/presentation/manager/home_var_state.dart';

import '../../../category/domain/entities/category_entity.dart';

class HomeCategoryCardWidget extends StatelessWidget {
  const HomeCategoryCardWidget({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeVarCubit, HomeVarState>(
      builder: (context, state) {
        bool isActive =
            categoryEntity.id == HomeVarCubit.get(context).categoryId;
        return GestureDetector(
          onTap: isActive
              ? null
              : () => HomeVarCubit.get(context)
                  .changeCategory(categoryEntity.id ?? ''),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: isActive ? context.primaryColor : null,
              border: Border.all(
                color: AppColors.borderColor,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                categoryEntity.name ?? '',
                style: context.subTitle!.copyWith(
                  color: isActive ? context.scaffoldColor : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
