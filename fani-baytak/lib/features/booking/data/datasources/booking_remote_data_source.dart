import 'package:injectable/injectable.dart';
import 'package:neomsim/core/helpers/firebase_helper.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/network/failure.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';

import '../models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getBooking();
  Future<bool> createNewBooking({
    required BookingModel bookingModel,
  });
  Future<bool> deleteBooking({
    required String bookingId,
  });
}

@Injectable(as: BookingRemoteDataSource)
class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  @override
  Future<bool> deleteBooking({
    required String bookingId,
  }) async {
    try {
      await FirebaseHelper.deleteData(
        collection: bookingCollection,
        documentId: bookingId,
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> createNewBooking({
    required BookingModel bookingModel,
  }) async {
    try {
      await FirebaseHelper.postData(
        collection: bookingCollection,
        data: bookingModel.toMap(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<BookingModel>> getBooking() async {
    try {
      final response = await FirebaseHelper.getData(
        collection: bookingCollection,
        needFilter: true,
        whereField: 'userId',
        whereValue: AppController.instance.getUserModel().id,
      );
      List<BookingModel> list = [];
      for (var e in response.docs) {
        list.add(BookingModel.fromJson(json: e.data()));
      }
      List<BookingModel> finalList = [];

      for (final element in list) {
        final response = await FirebaseHelper.getData(
          collection: offerCollection,
          needFilter: true,
          whereField: 'id',
          whereValue: element.offerId,
        );
        if (response.docs.isNotEmpty) {
          finalList.add(
            element.copyWith(
              offerModel: OfferModel.fromJson(
                json: response.docs[0].data(),
              ),
            ),
          );
        }
      }

      return finalList;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
