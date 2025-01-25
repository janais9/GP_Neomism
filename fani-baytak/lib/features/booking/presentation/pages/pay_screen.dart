import 'package:checkout_screen_ui/checkout_ui.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/custom_loading_widget.dart';
import 'package:neomsim/features/booking/presentation/manager/create_new_booking_cubit.dart';

import '../../data/models/booking_model.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({
    super.key,
    required this.bookingModel,
  });
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).payNow,
      ),
      body: BlocConsumer<CreateNewBookingCubit, CreateNewBookingState>(
        listener: (context, state) {
          if (state is CreateNewBookingSuccessState) {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRouter.paySuccess);
            customErrorToast(
              context,
              errorText: S.of(context).createBookingSuccess,
              isSuccess: true,
            );
          }
          if (state is CreateNewBookingErrorState) {
            customErrorToast(context, errorText: state.errorMessage);
          }
        },
        builder: (context, state) => Stack(
          children: [
            CheckoutPage(
              data: CheckoutData(
                priceItems: [],
                payToName: '${context.user.firstName} ${context.user.lastName}',
                initEmail: context.user.email,
                initBuyerName:
                    '${context.user.firstName} ${context.user.lastName}',
                isApple: true,
                lockEmail: true,
                displayNativePay: false,
                onCardPay: (_, __) {
                  if (state is! CreateNewBookingLoadingState) {
                    CreateNewBookingCubit.get(context).createNewBooking(
                      bookingModel: bookingModel,
                    );
                  }
                },
              ),
            ),
            if (state is CreateNewBookingLoadingState)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
                child: const Center(
                  child: CustomLoadingWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
