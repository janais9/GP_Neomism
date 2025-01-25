import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/image_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';

import '../../../category/domain/entities/category_entity.dart';

class HomeCategoryCardWidget extends StatelessWidget {
  const HomeCategoryCardWidget({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.category,
        arguments: categoryEntity,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            ImageWidget(
              image: categoryEntity.flag ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            const VerticalSizedBox(10),
            Text(
              categoryEntity.name ?? '',
              style: context.subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
