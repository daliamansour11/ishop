



import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/products_entity.dart';



abstract class ProductsState extends Equatable{

  final List<ProductsEntity>? products;
  // final List<ProductsEntity>? searchedProducts;
  final DioException ? error;

  const ProductsState( {this.products, this.error,});
  @override
  List<Object?> get props =>[products,error];
}
class RemoteProductsLoading extends ProductsState {
  const RemoteProductsLoading();
}
class RemoteProductsDone extends ProductsState{
  const RemoteProductsDone(List<ProductsEntity>product):super(products:product);


}
class RemoteProductsError extends ProductsState{
  const RemoteProductsError(DioException error):super(error:error);

}