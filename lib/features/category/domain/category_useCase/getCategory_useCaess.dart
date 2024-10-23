


import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/useCase.dart';
import '../category_reposotry_interface/CategoryBaseRepo.dart';
import '../entity/categor_entity.dart';


class GetCategoryUseCase implements UseCase<DataState<CategoryEntity>,void>{

  final CategoryBaseRepo categoryBaseRepo;

  GetCategoryUseCase({ required this.categoryBaseRepo});


  @override
  Future  <DataState<CategoryEntity>>call ({void params}){
    return categoryBaseRepo.getProductsCategory();
  }

}