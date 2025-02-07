


import '../../domain/entity/categor_entity.dart';

abstract class CategoriesEvent {
  CategoryClick( );
  const CategoriesEvent();
}

class GetCategoriesEvent extends CategoriesEvent{
  final List<CategoryEntity>? categoryName;
  const GetCategoriesEvent( { this.categoryName});

  @override
  CategoryClick() {
  }
}
// enum CategoryEvent{
//   click,
// }