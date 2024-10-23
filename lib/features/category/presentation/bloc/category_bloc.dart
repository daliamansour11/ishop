


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../home/domain/useCaes/get_productsCategory.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoriesEvent,CategoryState>{
  final GetCategoryUseCase _getCategorysUseCase;
  String category;
  CategoryBloc(this ._getCategorysUseCase,this.category):super(const RemoteCategoryLoading()){
    on<GetCategoriesEvent>(onGetCategory);

  }
void onGetCategory(GetCategoriesEvent event ,Emitter<CategoryState>emitter) async{
    final dataState = await _getCategorysUseCase();
    if(dataState is DataSuccess ){
      print("we are hereeeeeeeeeeee555 ${dataState.data}");

        event.CategoryClick(category);
      emit(RemoteCategoryDone(dataState.data!));
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
      emit(RemoteCategoryError(dataState.error!));
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