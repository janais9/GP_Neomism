import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/custom_avatar_widget.dart';
import 'package:neomsim/core/widgets/custom_loading_widget.dart';
import 'package:neomsim/core/widgets/error_state_widget.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/contact_us/presentation/manager/get_contact_us_cubit.dart';

class GetContactUsScreen extends StatelessWidget {
  const GetContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).contactUs,
      ),
      body: BlocBuilder<GetContactUsCubit, GetContactUsState>(
        builder: (context, state) {
          if (state is GetContactUsSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  children: state.contactUs
                      .map((element) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyBorderFiledColor,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            child: Row(
                              children: [
                                CustomAvatarWidget(
                                  avatar: element.userEntity?.image,
                                ),
                                const HorizontalSizedBox(5),
                                Column(
                                  children: [
                                    Text(
                                      '${element.userEntity?.firstName ?? ''} ${element.userEntity?.lastName ?? ''}',
                                      style: context.subBody,
                                    ),
                                    const VerticalSizedBox(5),
                                    Text(
                                      '${S.of(context).subject}: ${element.subject}',
                                      style: context.subBody,
                                    ),
                                    const VerticalSizedBox(5),
                                    Text(
                                      '${S.of(context).body}: ${element.body}',
                                      style: context.subBody,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          } else if (state is GetContactUsErrorState) {
            return ErrorStateWidget(
              error: state.errorMessage,
              function: () => GetContactUsCubit.get(context).getContactUss(),
            );
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
