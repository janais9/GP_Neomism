import 'package:injectable/injectable.dart';
import 'package:neomsim/core/helpers/firebase_helper.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/network/failure.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';

import '../models/contact_us_model.dart';

abstract class ContactUsRemoteDataSource {
  Future<List<ContactUsModel>> getContactUs();
  Future<bool> contactUs({
    required ContactUsModel contactModel,
  });
}

@Injectable(as: ContactUsRemoteDataSource)
class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  @override
  Future<bool> contactUs({
    required ContactUsModel contactModel,
  }) async {
    try {
      await FirebaseHelper.postData(
        collection: contactUsCollection,
        data: contactModel.toMap(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<ContactUsModel>> getContactUs() async {
    try {
      final response = await FirebaseHelper.getData(
        collection: contactUsCollection,
      );
      List<ContactUsModel> list = [];
      for (var e in response.docs) {
        ContactUsModel contactUsModel = ContactUsModel.fromJson(e.data());
        final response2 = await FirebaseHelper.getData(
          collection: userCollection,
          needFilter: true,
          whereField: 'id',
          whereValue: contactUsModel.userId,
        );
        if (response2.docs.isNotEmpty) {
          list.add(
            contactUsModel.copyWith(
              userModel: UserModel.fromJson(
                response2.docs[0].data(),
              ),
            ),
          );
        }
      }
      return list;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
