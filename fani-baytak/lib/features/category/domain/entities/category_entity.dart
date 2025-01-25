import '../../../../core/global_model/drop_down_model.dart';

class CategoryEntity extends DropDownModel {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? flag;

  CategoryEntity({
    required this.id,
    required this.flag,
    required this.name,
  });
}
