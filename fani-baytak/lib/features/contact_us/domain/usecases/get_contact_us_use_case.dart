import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/contact_us_entity.dart';
import '../repositories/contact_us_repo.dart';

@injectable
class GetContactUsUseCase {
  final ContactUsRepo _repo;
  const GetContactUsUseCase(
    this._repo,
  );

  Future<Either<Failure, List<ContactUsEntity>>> call() async {
    return await _repo.getContactUs();
  }
}
