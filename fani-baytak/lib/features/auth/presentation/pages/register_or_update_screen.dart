import 'package:neomsim/core/global_bloc/drop_list/drop_list_cubit.dart';
import 'package:neomsim/core/global_bloc/image/image_cubit.dart';
import 'package:neomsim/core/global_bloc/image/image_state.dart';
import 'package:neomsim/core/global_model/drop_down_model.dart';
import 'package:neomsim/core/helpers/constant.dart';
import 'package:neomsim/core/helpers/custom_validation.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/custom_circle_avatar.dart';
import 'package:neomsim/core/widgets/drop_down_widget.dart';
import 'package:neomsim/core/widgets/mobile_number_filed.dart';
import 'package:neomsim/core/widgets/title%20_text_field_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';
import 'package:neomsim/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/assets/assets.gen.dart';

class RegisterOrUpdateScreen extends StatefulWidget {
  const RegisterOrUpdateScreen({
    super.key,
    this.fromProfile = false,
  });
  final bool fromProfile;

  @override
  State<RegisterOrUpdateScreen> createState() => _RegisterOrUpdateScreenState();
}

class _RegisterOrUpdateScreenState extends State<RegisterOrUpdateScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _bioController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    ImageCubit.imageProfile = null;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _bioController = TextEditingController();
    _passwordController = TextEditingController();
    DropListCubit.dropListValue.clear();
    if (widget.fromProfile) {
      _firstNameController.text = context.user.firstName;
      _lastNameController.text = context.user.lastName;
      _phoneController.text = context.user.mobileNumber;
      _emailController.text = context.user.email;
      DropDownModel gender = DropDownModel(
        id: context.user.gender.name,
        name: context.user.gender.nameText,
      );
      DropListCubit.dropListValue[genderKey] = gender;
    }
  }

  @override
  void dispose() {
    super.dispose();
    ImageCubit.imageProfile = null;
    DropListCubit.dropListValue.clear();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (!widget.fromProfile) ...[
            Assets.images.startedApp.image(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: widget.fromProfile
                  ? 20.h
                  : MediaQuery.of(context).size.height / 4,
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
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSizedBox(30),
                      if (!widget.fromProfile) ...[
                        Text(
                          S.of(context).welcomeToNeomsim,
                          style: context.subTitle,
                        ),
                        Text(
                          S.of(context).registerDesc,
                          style: context.subBody,
                        ),
                      ],
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<ImageCubit, ImageState>(
                            builder: (context, imageState) => Center(
                              child: Stack(
                                children: [
                                  ImageCubit.imageProfile != null
                                      ? CustomCircleAvatar(
                                          imageFile: ImageCubit.imageProfile!,
                                          radius: 64,
                                          backgroundColor: context.primaryColor,
                                        )
                                      : CustomCircleAvatar(
                                          imageUrl: context.user.image,
                                          radius: 64,
                                          backgroundColor: context.primaryColor,
                                        ),
                                  InkWell(
                                    onTap: () =>
                                        ImageCubit.get(context).getImage(),
                                    child: CustomCircleAvatar(
                                      radius: 22,
                                      backgroundColor: AppColors.primaryColor,
                                      child: CustomCircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        child: Icon(
                                          Icons.camera,
                                          color: context.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalSizedBox(32),
                          TitleTextFieldWidget(
                            title: S.of(context).firstName,
                            hint: S.of(context).firstName,
                            controller: _firstNameController,
                          ),
                          const VerticalSizedBox(16),
                          TitleTextFieldWidget(
                            title: S.of(context).lastName,
                            hint: S.of(context).lastName,
                            controller: _lastNameController,
                          ),
                          const VerticalSizedBox(16),
                          TitleTextFieldWidget(
                            title: S.of(context).email,
                            hint: S.of(context).email,
                            controller: _emailController,
                            keyboard: TextInputType.emailAddress,
                          ),
                          if (!widget.fromProfile) ...[
                            const VerticalSizedBox(16),
                            TitleTextFieldWidget(
                              title: S.of(context).password,
                              hint: S.of(context).password,
                              controller: _passwordController,
                              isPassword: true,
                            ),
                          ],
                          const VerticalSizedBox(16),
                          MobileNumberFiled(
                            controller: _phoneController,
                            needTitle: true,
                            titleTextStyle: context.greyText,
                          ),
                          DropDownWidget(
                            keyStr: genderKey,
                            list: genderList,
                            value:
                                DropListCubit.dropListValue[genderKey]?.name ??
                                    '',
                            title: S.of(context).gender,
                            needTitle: true,
                          ),
                          const VerticalSizedBox(32),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is RegisterSuccessState) {
                                AppController.instance.setLoggedIn(true);
                                AppController.instance
                                    .saveUser(state.userModel);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, AppRouter.main, (_) => false);
                              }
                              if (state is RegisterErrorState) {
                                customErrorToast(
                                  context,
                                  errorText: state.errorMessage,
                                );
                              }
                            },
                            builder: (context, state) => AppBtn(
                              title: widget.fromProfile
                                  ? S.of(context).save
                                  : S.of(context).register,
                              function: () {
                                bool validation1 =
                                    CustomValidator.validateTextFields(
                                  context: context,
                                  controllers: [
                                    _firstNameController,
                                    _lastNameController,
                                    _emailController,
                                    _phoneController,
                                  ],
                                  errorMessages: [
                                    S.of(context).firstNameError,
                                    S.of(context).lastNameError,
                                    S.of(context).emailError,
                                    S.of(context).mobileNumberError,
                                  ],
                                );
                                if (validation1) {
                                  context.read<AuthCubit>().register(
                                        userModel: getFinalUserModel(),
                                        password: widget.fromProfile
                                            ? null
                                            : _passwordController.text,
                                      );
                                }
                              },
                              isLoading: state is RegisterLoadingState,
                            ),
                          ),
                          const VerticalSizedBox(32),
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

  UserModel getFinalUserModel() => UserModel(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        image: ImageCubit.imageProfile?.path,
        type: widget.fromProfile ? context.user.type : UserType.customer,
        mobileNumber: _phoneController.text,
        gender: stringToGender[
                DropListCubit.dropListValue[genderKey]?.id ?? 'male'] ??
            Gender.male,
      );
}
