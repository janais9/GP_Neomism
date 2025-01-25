import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:neomsim/core/network/failure.dart';
import 'package:neomsim/features/category/data/datasources/category_remote_data_source.dart';
import 'package:neomsim/features/category/domain/repositories/category_repo.dart';

import '../../domain/entities/category_entity.dart';
import '../models/category_model.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  const CategoryRepoImpl(this._categoryRemoteDataSource);

  @override
  Future<Either<ServerFailure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await _categoryRemoteDataSource.getCategories();
      List<CategoryEntity> list = [];
      for (final element in response) {
        list.add(element.toEntity());
      }
      return Right(list);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<ServerFailure, bool>> createNewCategory({
    required CategoryModel categoryModel,
  }) async {
    try {
      final response = await _categoryRemoteDataSource.createNewCategory(
        categoryModel: categoryModel,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
