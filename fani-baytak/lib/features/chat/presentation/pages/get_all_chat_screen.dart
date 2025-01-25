import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/custom_avatar_widget.dart';
import 'package:neomsim/core/widgets/custom_loading_widget.dart';
import 'package:neomsim/core/widgets/error_state_widget.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/chat/presentation/manager/get_all_chat_cubit.dart';

class GetAllChatScreen extends StatefulWidget {
  const GetAllChatScreen({super.key});

  @override
  State<GetAllChatScreen> createState() => _GetAllChatScreenState();
}

class _GetAllChatScreenState extends State<GetAllChatScreen> {
  @override
  void initState() {
    super.initState();
    GetAllChatCubit.get(context).getAllChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).chat,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<GetAllChatCubit, GetAllChatState>(
          builder: (context, state) {
            if (state is GetAllChatSuccessState) {
              return ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.chat,
                      arguments: state.chats[index].id,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        CustomAvatarWidget(
                          avatar: state.chats[index].image,
                          radius: 20,
                        ),
                        const HorizontalSizedBox(5),
                        Text(
                          '${state.chats[index].firstName} ${state.chats[index].lastName}',
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const VerticalSizedBox(10),
                itemCount: state.chats.length,
              );
            } else if (state is GetAllChatErrorState) {
              return ErrorStateWidget(
                error: state.errorMessage,
                function: () => GetAllChatCubit.get(context).getAllChat(),
              );
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
