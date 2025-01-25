import 'package:neomsim/core/global_model/name_model.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/routes/common_import.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel {
  final String? id;
  final NameModel? name;
  final String? flag;

  CategoryModel({
    required this.id,
    required this.flag,
    required this.name,
  });
  factory CategoryModel.fromJson({required Map<String, dynamic> json}) =>
      CategoryModel(
        id: json['id'] ?? '',
        flag: json['image'] ?? '',
        name: json['name'] == null
            ? NameModel.emptyOne()
            : NameModel.fromJson(
                json: json['name'],
              ),
      );

  factory CategoryModel.emptyOne() => CategoryModel(
        id: '',
        flag: '',
        name: NameModel.emptyOne(),
      );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        'image': flag,
        if (id?.isNotEmpty ?? false) 'id': id,
      };
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        flag: flag,
        name: AppController.instance.getLanguageCode() == arabicCode
            ? name?.ar
            : name?.en,
      );
}
