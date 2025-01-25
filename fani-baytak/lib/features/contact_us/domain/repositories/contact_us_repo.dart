import 'package:dartz/dartz.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/contact_us_model.dart';
import '../entities/contact_us_entity.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, List<ContactUsEntity>>> getContactUs();
  Future<Either<Failure, bool>> contactUs({
    required ContactUsModel contactModel,
  });
}
