import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/core/helpers/firebase_helper.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';

import '../../../../core/helpers/string_constant.dart';
import '../model/chat_message_model.dart';

abstract class ChatRemoteDataSource {
  Stream<List<ChatMessageModel>> getMessages(String? chatId);
  Future<List<UserModel>> getAllChat();
  Future<void> sendMessage(String? chatId, ChatMessageModel message);
}

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Stream<List<ChatMessageModel>> getMessages(String? chatId) {
    return FirebaseHelper.firestoreInstance
        .collection(chatCollection)
        .doc(chatId ?? AppController.instance.getUserModel().id)
        .collection(messageCollection)
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMessageModel.fromJson(doc.data());
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String? chatId, ChatMessageModel message) async {
    final parentDocId = chatId ?? AppController.instance.getUserModel().id;

    final parentDoc = FirebaseHelper.firestoreInstance
        .collection(chatCollection)
        .doc(parentDocId);

    await parentDoc.set({'exists': true}, SetOptions(merge: true));

    await parentDoc
        .collection(messageCollection)
        .doc(message.id)
        .set(message.toJson());
  }

  @override
  Future<List<UserModel>> getAllChat() async {
    final response =
        await FirebaseHelper.firestoreInstance.collection(chatCollection).get();

    List<UserModel> list = [];

    for (var e in response.docs) {
      final response2 = await FirebaseHelper.getData(
        collection: userCollection,
        needFilter: true,
        whereField: 'id',
        whereValue: e.id,
      );
      if (response2.docs.isNotEmpty) {
        list.add(UserModel.fromJson(response2.docs.first.data()));
      }
    }
    return list;
  }
}
