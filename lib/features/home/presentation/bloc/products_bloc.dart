

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/features/home/presentation/bloc/products_event.dart';
import 'package:ishop/features/home/presentation/bloc/products_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../domain/useCaes/get_products.dart';


class ProductsBloc extends Bloc<ProductsEvent,ProductsState>{
  final GetProductsUseCase _getArticleUseCase;

  ProductsBloc(this ._getArticleUseCase):super(const RemoteProductsLoading()){
    on<GetProducts>(onGetProducts);
  }
  void onGetProducts(GetProducts event ,Emitter<ProductsState>emitter) async{
    final dataState = await _getArticleUseCase();
    if(dataState is DataSuccess && dataState .data!.isNotEmpty){

      print("we are hereeeeeeeeeeee555 ${dataState.data}");
      emit(RemoteProductsDone(dataState.data!));
    }
    if(dataState is DataFailed) {
      // if (dataState.error != null) {
      //   if (dataState.error is DioException) {
      //     DioException dioError = dataState.error as DioException;
      //     String errorMessage = dioError.message ?? "An error occurred, but no message was provided";
      //
      //     // Log the detailed information for debugging
      //     print("we are hereeeeeeeeeeeee $errorMessage");
      //     print("Error Type: ${dioError.type}");
      //     if (dioError.response != null) {
      //       print("Response status code: ${dioError.response?.statusCode}");
      //       // print("Response status message: ${dioError.response?.statusMessage}");
      //        print("Response data: ${dioError.response?.data}");
      //     }
      //     if (dioError.error != null) {
      //       print("Underlying error: ${dioError.error}");
      //     }
      print("hereeeeeeeeeeeee${dataState.error!.message}");
      emit(RemoteProductsError(dataState.error!));
    }
    //   } else {
    //     print("we are hereeeeeeeeeeeee An unknown error occurred");
    //      emit(RemoteArticlesError((dataState.error!.message as DioException)));
    //   }
    // } else {
    //   print("No error found, but something went wrong.");
    // }




  }
}