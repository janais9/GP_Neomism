import 'package:flutter/material.dart';
import 'package:neomsim/core/helpers/custom_validation.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/title%20_text_field_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/contact_us/data/models/contact_us_model.dart';
import 'package:neomsim/features/contact_us/presentation/manager/contact_us_cubit.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController _emailController;
  late TextEditingController _subjectController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _subjectController = TextEditingController();
    _bodyController = TextEditingController();
    _emailController.text = AppController.instance.getUserModel().email;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _bodyController.dispose();
    _subjectController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).contactUs,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              TitleTextFieldWidget(
                hint: S.of(context).email,
                readOnly: true,
                controller: _emailController,
                title: S.of(context).email,
              ),
              const VerticalSizedBox(10),
              TitleTextFieldWidget(
                hint: S.of(context).subject,
                controller: _subjectController,
                title: S.of(context).subject,
              ),
              const VerticalSizedBox(10),
              TitleTextFieldWidget(
                hint: S.of(context).body,
                controller: _bodyController,
                title: S.of(context).body,
                maxLine: 5,
              ),
              const VerticalSizedBox(16),
              BlocConsumer<ContactUsCubit, ContactUsState>(
                listener: (context, state) {
                  if (state is ContactUsSuccessState) {
                    _subjectController.text = '';
                    _bodyController.text = '';
                    customErrorToast(
                      context,
                      errorText: S.of(context).contactUsSuccess,
                      isSuccess: true,
                    );
                  }
                  if (state is ContactUsErrorState) {
                    customErrorToast(
                      context,
                      errorText: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is ContactUsLoadingState,
                  title: S.of(context).send,
                  function: () {
                    bool validation = CustomValidator.validateTextFields(
                      context: context,
                      controllers: [
                        _emailController,
                        _subjectController,
                        _bodyController,
                      ],
                      errorMessages: [
                        S.of(context).emailError,
                        S.of(context).subjectError,
                        S.of(context).bodyError,
                      ],
                    );
                    if (validation) {
                      ContactUsCubit.get(context).contactUs(
                        contactModel: getFinalContactUsModel(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ContactUsModel getFinalContactUsModel() => ContactUsModel(
        body: _bodyController.text,
        email: _emailController.text,
        id: '',
        subject: _subjectController.text,
        userId: AppController.instance.getUserModel().id ?? '',
      );
}
