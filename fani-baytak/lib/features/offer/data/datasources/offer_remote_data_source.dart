import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:neomsim/core/helpers/firebase_helper.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/network/failure.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getOffers({
    String categoryId = '',
  });
  Future<List<OfferModel>> getRecommendedOffers();
  Future<bool> createNewOffer({
    required OfferModel offerModel,
  });
}

@Injectable(as: OfferRemoteDataSource)
class OfferRemoteDataSourceImpl implements OfferRemoteDataSource {
  @override
  Future<bool> createNewOffer({
    required OfferModel offerModel,
  }) async {
    try {
      List<String> imagesPath = offerModel.images;
      List<String> finalImagesUrl = [];
      for (final element in imagesPath) {
        String imageUrl = await FirebaseHelper.uploadFile(
          file: File(element),
          userId: AppController.instance.getUserModel().id ?? '',
          folderName: offerCollection,
        );
        finalImagesUrl.add(imageUrl);
      }
      OfferModel finalOfferModel = offerModel.copyWith(images: finalImagesUrl);
      await FirebaseHelper.postData(
        collection: offerCollection,
        data: finalOfferModel.toMap(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<OfferModel>> getOffers({
    String categoryId = '',
  }) async {
    try {
      final response = await FirebaseHelper.getData(
        collection: offerCollection,
        needFilter: categoryId.isNotEmpty,
        whereField: categoryId.isNotEmpty ? 'categoryId' : '',
        whereValue: categoryId,
      );
      List<OfferModel> list = [];
      for (var e in response.docs) {
        list.add(OfferModel.fromJson(json: e.data()));
      }
      return list;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<OfferModel>> getRecommendedOffers() async {
    try {
      final response = await FirebaseHelper.getData(
        collection: offerCollection,
        needFilter: true,
        whereField: 'isRecommended',
        whereValue: true,
      );
      List<OfferModel> list = [];
      for (var e in response.docs) {
        list.add(OfferModel.fromJson(json: e.data()));
      }
      log('listlistlist ${list.length}');
      return list;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
