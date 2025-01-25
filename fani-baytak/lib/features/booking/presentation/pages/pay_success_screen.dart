import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';

class PaySuccessScreen extends StatelessWidget {
  const PaySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).createBookingSuccess,
                style: context.subTitle,
              ),
              const VerticalSizedBox(15),
              AppBtn(
                title: S.of(context).gotoBookingList,
                function: () => Navigator.pushNamed(
                  context,
                  AppRouter.bookingList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
