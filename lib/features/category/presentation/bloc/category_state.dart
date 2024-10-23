



import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ishop/features/category/domain/entity/categor_entity.dart';



abstract class CategoryState extends Equatable{

  final CategoryEntity? products;
  final DioException ? error;

  const CategoryState({this.products, this.error});
  @override
  List<Object?> get props =>[products,error];
}
class RemoteCategoryLoading extends CategoryState {
  const RemoteCategoryLoading();
}
class RemoteCategoryDone extends CategoryState{
  const RemoteCategoryDone(CategoryEntity product):super(products:product);


}
class RemoteCategoryError extends CategoryState{
  const RemoteCategoryError(DioException error):super(error:error);

}