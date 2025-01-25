import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/category_model.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<ServerFailure, List<CategoryEntity>>> getCategories();
  Future<Either<ServerFailure, bool>> createNewCategory({
    required CategoryModel categoryModel,
  });
}
