import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/custom_loading_widget.dart';
import 'package:neomsim/core/widgets/error_state_widget.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/category/presentation/manager/get_category_cubit.dart';
import 'package:neomsim/features/home/presentation/manager/home_var_cubit.dart';
import 'package:neomsim/features/home/presentation/manager/home_var_state.dart';
import 'package:neomsim/features/home/presentation/widgets/home_category_card_widget.dart';
import 'package:neomsim/features/home/presentation/widgets/home_offer_widget.dart';
import 'package:neomsim/features/home/presentation/widgets/home_recommended_widget.dart';
import 'package:neomsim/features/offer/presentation/manager/get_offers_cubit.dart';
import 'package:neomsim/features/offer/presentation/manager/get_recommended_offers_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    GetCategoryCubit.get(context).getCategories(needShowAll: true);
    GetRecommendedCubit.get(context).getOffers();
    GetOffersCubit.get(context).getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).welcomeToNeomsim,
        suffix: isAdmin()
            ? InkWell(
                onTap: () => Navigator.pushNamed(
                      context,
                      AppRouter.createNewOffer,
                    ),
                child: const Icon(Icons.add))
            : null,
      ),
      body: BlocListener<HomeVarCubit, HomeVarState>(
        listener: (context, state) {
          if (state is HomeVarChangeTabState) {
            GetOffersCubit.get(context).getOffers(
              categoryId: HomeVarCubit.get(context).categoryId,
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                  builder: (context, state) =>
                      state is GetCategoriesSuccessState
                          ? SizedBox(
                              height: 40.h,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    HomeCategoryCardWidget(
                                  categoryEntity: state.categories[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const HorizontalSizedBox(10),
                                itemCount: state.categories.length,
                              ),
                            )
                          : const SizedBox(),
                ),
                const VerticalSizedBox(20),
                Text(
                  S.of(context).recommended,
                  style: context.subTitle,
                ),
                const VerticalSizedBox(10),
                SizedBox(
                  height: 140.h,
                  child: BlocBuilder<GetRecommendedCubit,
                      GetRecommendedOffersState>(
                    builder: (context, state) {
                      if (state is GetRecommendedOffersSuccessState) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              HomeRecommendedWidget(
                            offerEntity: state.offers[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const HorizontalSizedBox(10),
                          itemCount: state.offers.length,
                        );
                      } else if (state is GetRecommendedOffersErrorState) {
                        return ErrorStateWidget(
                          error: state.errorMessage,
                          function: () =>
                              GetRecommendedCubit.get(context).getOffers(),
                        );
                      } else {
                        return const CustomLoadingWidget();
                      }
                    },
                  ),
                ),
                const VerticalSizedBox(20),
                Text(
                  S.of(context).latestOffer,
                  style: context.subTitle,
                ),
                const VerticalSizedBox(10),
                BlocBuilder<GetOffersCubit, GetOffersState>(
                  builder: (context, state) {
                    if (state is GetOffersSuccessState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                        function: () => GetOffersCubit.get(context).getOffers(),
                      );
                    } else {
                      return const CustomLoadingWidget();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
