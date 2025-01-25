import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/image_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

import '../../../../core/routes/app_router.dart';

class HomeRecommendedWidget extends StatelessWidget {
  const HomeRecommendedWidget({
    super.key,
    required this.offerEntity,
  });
  final OfferEntity offerEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.offerDetails,
        arguments: [offerEntity],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(12.r),
                topStart: Radius.circular(12.r),
              ),
              child: ImageWidget(
                image: offerEntity.images.firstOrNull ?? '',
                height: 100,
                width: 150,
              ),
            ),
            const VerticalSizedBox(10),
            Text(
              AppController.instance.getLanguageCode() == arabicCode
                  ? offerEntity.title.ar
                  : offerEntity.title.en,
            ),
          ],
        ),
      ),
    );
  }
}
