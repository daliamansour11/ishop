

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishop/core/resources/data_state.dart';

import '../../domain/entities/products_entity.dart';
import '../../domain/repository_intface/products_BaseRepository.dart';
import '../remote_dataSourse/productApiService.dart';

class ProductsRepositoryImp extends ProductsRepository{
   final ProductApiService productApiService;

   ProductsRepositoryImp(this.productApiService);
  @override
  Future<DataState<List<ProductsEntity>>> getAllProducts() async{
    try {
      final httpResponse = await productApiService.getAllProducts(
      );
      // Check if the status code is OK (200)
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage ?? 'Unknown Error',
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      // Provide more detailed error information for debugging
      print('Error occurred during API call: ${e.message}');
      return DataFailed(e);
    }
}

}