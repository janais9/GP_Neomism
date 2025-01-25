import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/contact_us_model.dart';
import '../repositories/contact_us_repo.dart';

@injectable
class ContactUsUseCase {
  final ContactUsRepo _repo;
  const ContactUsUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call(
      {required ContactUsModel contactModel}) async {
    return await _repo.contactUs(contactModel: contactModel);
  }
}
