import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/custom_loading_widget.dart';
import 'package:neomsim/core/widgets/error_state_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/booking/presentation/manager/delete_booking_cubit.dart';
import 'package:neomsim/features/booking/presentation/manager/get_offers_cubit.dart';
import 'package:neomsim/features/home/presentation/widgets/home_offer_widget.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).bookingList,
      ),
      body: BlocBuilder<GetBookingsCubit, GetBookingsState>(
        builder: (context, state) {
          if (state is GetBookingsSuccessState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: ListView.separated(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      child: HomeOfferWidget(
                        offerEntity: state.offers[index].offerEntity ??
                            OfferModel.emptyOne().toEntity(),
                        bookingEntity: state.offers[index],
                      ),
                    ),
                    BlocConsumer<DeleteBookingCubit, DeleteBookingState>(
                      listener: (context, deleteState) {
                        if (deleteState is DeleteBookingSuccessState) {
                          customErrorToast(
                            context,
                            errorText: S.of(context).deleteBookingSuccessfully,
                            isSuccess: true,
                          );
                          Navigator.pop(context);
                          Navigator.pushNamed(context, AppRouter.bookingList);
                        }
                        if (deleteState is DeleteBookingErrorState) {
                          customErrorToast(context,
                              errorText: deleteState.errorMessage);
                        }
                      },
                      builder: (context, deleteState) => GestureDetector(
                        onTap: deleteState is DeleteBookingLoadingState
                            ? null
                            : () {
                                log('state.offers[index].id ${state.offers[index].id}');
                                DeleteBookingCubit.get(context).deleteBooking(
                                  bookingId: state.offers[index].id,
                                );
                              },
                        child: Icon(
                          Icons.delete,
                          color: AppColors.dangerColor,
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) =>
                    const VerticalSizedBox(10),
                itemCount: state.offers.length,
              ),
            );
          } else if (state is GetBookingsErrorState) {
            return ErrorStateWidget(
              error: state.errorMessage,
              function: () {},
            );
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
