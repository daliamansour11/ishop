

import '../../../../core/resources/data_state.dart';
import '../entity/categor_entity.dart';

abstract class CategoryBaseRepo {
   Future<DataState<CategoryEntity>> getProductsCategory();
 }