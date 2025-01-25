import 'package:neomsim/core/assets/assets.gen.dart';
import 'package:neomsim/core/helpers/custom_validation.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/title%20_text_field_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
            padding: EdgeInsetsDirectional.only(
              top: MediaQuery.of(context).size.height / 2,
            ),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: context.scaffoldColor,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(30.r),
                  topStart: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      const VerticalSizedBox(20),
                      Text(
                        S.of(context).login,
                        style: context.mainTitle,
                      ),
                      const VerticalSizedBox(20),
                      TitleTextFieldWidget(
                        hint: S.of(context).email,
                        controller: _emailController,
                        keyboard: TextInputType.emailAddress,
                      ),
                      const VerticalSizedBox(10),
                      TitleTextFieldWidget(
                        hint: S.of(context).password,
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      const VerticalSizedBox(20),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoginErrorState) {
                            customErrorToast(context,
                                errorText: state.errorMessage);
                          }
                          if (state is LoginSuccessState) {
                            AppController.instance.setLoggedIn(true);
                            AppController.instance.saveUser(state.userModel);
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRouter.main, (_) => false);
                          }
                        },
                        builder: (context, state) => AppBtn(
                          title: S.of(context).login,
                          function: () {
                            bool validation =
                                CustomValidator.validateTextFields(
                              context: context,
                              controllers: [
                                _emailController,
                                _passwordController
                              ],
                              errorMessages: [
                                S.of(context).emailError,
                                S.of(context).passwordError,
                              ],
                            );
                            if (validation) {
                              context.read<AuthCubit>().login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                            }
                          },
                          isLoading: state is LoginLoadingState,
                        ),
                      ),
                      const VerticalSizedBox(30),
                      Row(
                        children: [
                          Text(
                            S.of(context).dontHaveAnAccount,
                            style: context.greyText,
                          ),
                          const HorizontalSizedBox(5),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.registerOrUpdate),
                            child: Text(
                              S.of(context).registerNow,
                              style: context.greyText!.copyWith(
                                color: context.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
