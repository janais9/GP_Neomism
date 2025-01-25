import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/features/category/domain/entities/category_entity.dart';
import 'package:neomsim/features/home/presentation/widgets/home_offer_widget.dart';
import 'package:neomsim/features/offer/presentation/manager/get_offers_cubit.dart';

import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/vertical_sized_box.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: categoryEntity.name ?? '',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: BlocBuilder<GetOffersCubit, GetOffersState>(
          builder: (context, state) {
            if (state is GetOffersSuccessState) {
              return ListView.separated(
                itemBuilder: (context, index) => HomeOfferWidget(
                  offerEntity: state.offers[index],
                ),
                separatorBuilder: (context, index) =>
                    const VerticalSizedBox(10),
                itemCount: state.offers.length,
              );
            } else if (state is GetOffersErrorState) {
              return ErrorStateWidget(
                error: state.errorMessage,
                function: () => GetOffersCubit.get(context)
                    .getOffers(categoryId: categoryEntity.id ?? ''),
              );
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
