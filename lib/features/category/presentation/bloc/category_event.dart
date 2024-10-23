


abstract class CategoriesEvent {
  CategoryClick(String category);
  const CategoriesEvent();
}

class GetCategoriesEvent extends CategoriesEvent{
  final String? categoryName;
  const GetCategoriesEvent( { this.categoryName});

  @override
  CategoryClick(String category) {
  }
}
// enum CategoryEvent{
//   click,
// }