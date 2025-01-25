import 'package:flutter/material.dart';
import 'package:neomsim/core/assets/assets.gen.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';

class StartedApp extends StatelessWidget {
  const StartedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              Assets.images.startedApp.image(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    Text(
                      S.of(context).startedAppDesc1,
                      style: context.mainTitle!.copyWith(
                        color: context.scaffoldColor,
                      ),
                    ),
                    Text(
                      S.of(context).startedAppDesc2,
                      style: context.mainTitle!.copyWith(
                        color: context.scaffoldColor,
                      ),
                    ),
                    const VerticalSizedBox(10),
                    AppBtn(
                      title: S.of(context).login,
                      width: 200,
                      function: () => Navigator.pushNamed(
                        context,
                        AppRouter.login,
                      ),
                      btnColor: context.scaffoldColor,
                      textColor: AppColors.blackColor,
                    ),
                    const VerticalSizedBox(5),
                    AppBtn(
                      width: 200,
                      title: S.of(context).registerNow,
                      function: () => Navigator.pushNamed(
                        context,
                        AppRouter.registerOrUpdate,
                      ),
                      btnColor: context.scaffoldColor,
                      textColor: AppColors.blackColor,
                    ),
                    const VerticalSizedBox(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
