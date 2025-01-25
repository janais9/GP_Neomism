import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/image_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/booking/domain/entities/booking_entity.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

class HomeOfferWidget extends StatelessWidget {
  const HomeOfferWidget({
    super.key,
    required this.offerEntity,
    this.bookingEntity,
  });

  final OfferEntity offerEntity;
  final BookingEntity? bookingEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.offerDetails,
        arguments: [
          offerEntity,
          if (bookingEntity != null) bookingEntity,
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(12.r),
                topStart: Radius.circular(12.r),
              ),
              child: ImageWidget(
                image: offerEntity.images.firstOrNull ?? '',
                height: 250,
                width: double.infinity,
              ),
            ),
            const VerticalSizedBox(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppController.instance.getLanguageCode() == arabicCode
                        ? offerEntity.title.ar
                        : offerEntity.title.en,
                  ),
                  const VerticalSizedBox(5),
                  Row(
                    children: [
                      const Icon(Icons.pin_drop),
                      const HorizontalSizedBox(5),
                      Text(
                        offerEntity.location,
                        style: context.smallBody,
                      ),
                    ],
                  ),
                  const VerticalSizedBox(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
