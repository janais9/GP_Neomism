import 'package:neomsim/core/assets/assets.gen.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> title1 = [];
  List<String> title2 = [];
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    title1 = [
      S.of(context).welcome,
      S.of(context).weMade,
      S.of(context).experienceNeomesim,
    ];
    title2 = [
      S.of(context).toNeomsim,
      S.of(context).bookBrowse,
      S.of(context).likeNeverBefore,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.startedApp.image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    title1[currentIndex].toUpperCase(),
                    style: context.mainTitle!.copyWith(
                      color: context.scaffoldColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    title2[currentIndex].toUpperCase(),
                    style: context.mainTitle!.copyWith(
                      color: context.scaffoldColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalSizedBox(20),
                if (currentIndex + 1 < title1.length) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppBtn(
                        title: S.of(context).skip,
                        function: () {
                          currentIndex = title1.length - 1;
                          setState(() {});
                        },
                        btnColor: context.scaffoldColor,
                        textColor: AppColors.blackColor,
                      ),
                      const HorizontalSizedBox(5),
                      AppBtn(
                        title: S.of(context).next,
                        function: () {
                          currentIndex = currentIndex + 1;
                          setState(() {});
                        },
                        btnColor: context.scaffoldColor,
                        textColor: AppColors.blackColor,
                      ),
                    ],
                  ),
                ] else ...[
                  AppBtn(
                    title: S.of(context).login,
                    function: () => Navigator.pushNamed(
                      context,
                      AppRouter.login,
                    ),
                    btnColor: context.scaffoldColor,
                    textColor: AppColors.blackColor,
                  ),
                  const VerticalSizedBox(10),
                  AppBtn(
                    title: S.of(context).registerNow,
                    function: () => Navigator.pushNamed(
                      context,
                      AppRouter.registerOrUpdate,
                    ),
                    btnColor: context.scaffoldColor,
                    textColor: AppColors.blackColor,
                  ),
                ],
                const VerticalSizedBox(50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
