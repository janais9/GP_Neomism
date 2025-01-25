import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/error_state_widget.dart';
import 'package:neomsim/core/widgets/title%20_text_field_widget.dart';

import '../../../../core/routes/common_import.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';

class ChatScreen extends StatefulWidget {
  final String? chatId;
  const ChatScreen({
    super.key,
    this.chatId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().loadMessages(widget.chatId);

    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).chat,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return ListTile(
                        title: Text(
                          message.senderId == 'admin' ? 'Neomism' : 'you',
                        ),
                        subtitle: Text(message.message),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return ErrorStateWidget(
                    error: state.message,
                    function: () => context.read<ChatCubit>().loadMessages(
                          widget.chatId,
                        ),
                  );
                }
                return Center(
                  child: Text(
                    S.of(context).startChat,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TitleTextFieldWidget(
                    hint: S.of(context).send,
                    controller: _messageController,
                    suffix: GestureDetector(
                        onTap: () {
                          final message = ChatMessageEntity(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            senderId: isAdmin()
                                ? 'admin'
                                : 'user', // Replace with dynamic user ID
                            message: _messageController.text,
                            timestamp: DateTime.now(),
                          );
                          context
                              .read<ChatCubit>()
                              .sendMessage(widget.chatId, message);
                          _messageController.text = '';
                        },
                        child: const Icon(Icons.send)),
                    onSubmit: (val) {
                      final message = ChatMessageEntity(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        senderId: isAdmin()
                            ? 'admin'
                            : 'user', // Replace with dynamic user ID
                        message: val ?? '',
                        timestamp: DateTime.now(),
                      );
                      context
                          .read<ChatCubit>()
                          .sendMessage(widget.chatId, message);
                      _messageController.text = '';
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
