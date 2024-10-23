
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ishop/features/Authentication/data/data_source/user_apiService.dart';
import 'package:ishop/features/Authentication/data/reposititory_imp/user_repository_imp.dart';
import 'package:ishop/features/Authentication/domain/user_useCase/logedIn_UseCase.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLoginBloc.dart';

import 'features/home/data/products_repository_imp/product_repository_Imp.dart';
import 'features/home/data/remote_dataSourse/productApiService.dart';
import 'features/home/domain/repository_intface/products_BaseRepository.dart';
import 'features/home/domain/useCaes/get_products.dart';
import 'features/home/presentation/bloc/products_bloc.dart';


final s1= GetIt.instance;
Future<void> initializeDependencies() async {
  // final database= await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  // s1.registerLazySingleton<AppDatabase>(database as FactoryFunc<AppDatabase> );
  s1.registerSingleton<Dio>(Dio());
  //API
  s1.registerSingleton<ProductApiService>(ProductApiService(s1()));

  //REPOSITORY
  s1.registerSingleton<ProductsRepository>(
      ProductsRepositoryImp(s1()));
//USECASE
  s1.registerSingleton<GetProductsUseCase>(
      GetProductsUseCase(s1()));
//BLOC

  s1.registerSingleton<ProductsBloc>(
      ProductsBloc(s1()));



}