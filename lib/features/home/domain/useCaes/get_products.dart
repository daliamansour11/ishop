
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/useCase.dart';

import '../entities/products_entity.dart';
import '../repository_intface/products_BaseRepository.dart';


 class GetProductsUseCase implements UseCase<DataState<List<ProductsEntity>>,void>{

final ProductsRepository _productsRepo;

  GetProductsUseCase(this._productsRepo);
@override
  Future <DataState<List<ProductsEntity>>>call({void params}){

  return _productsRepo.getAllProducts();

  }

 }