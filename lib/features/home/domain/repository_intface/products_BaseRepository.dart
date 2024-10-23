

import 'package:ishop/core/resources/data_state.dart';

import '../entities/products_entity.dart';

abstract class ProductsRepository{
  Future<DataState<List<ProductsEntity>>> getAllProducts();

}