
 import 'package:ishop/features/category/domain/entity/categor_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/useCase.dart';
import '../../../category/data/caregory_repo_imp/category_repository_imp.dart';
import '../entities/products_entity.dart';

class GetCategoryUseCase implements UseCase<DataState<CategoryEntity>,void>{

final CategoryRepositoryImp _categorysRepo;

GetCategoryUseCase(this._categorysRepo);
@override
  Future <DataState<CategoryEntity>> call({void params}){

  return _categorysRepo.getProductsCategory();

  }

 }