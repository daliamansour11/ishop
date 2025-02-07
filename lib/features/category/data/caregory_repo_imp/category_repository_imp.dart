

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ishop/core/resources/data_state.dart';
import 'package:ishop/features/category/domain/entity/categor_entity.dart';

import '../../../home/data/remote_dataSourse/productApiService.dart';
import '../../../home/domain/entities/products_entity.dart';
import '../../domain/category_reposotry_interface/CategoryBaseRepo.dart';

class CategoryRepositoryImp extends CategoryBaseRepo{
  final ProductApiService productApiService;

  CategoryRepositoryImp(this.productApiService,);

  @override
  Future<DataState<CategoryEntity>> getProductsCategory() async{
      try {
        final httpResponse = await productApiService.getproducts_category();

        // Check if the status code is OK (200)
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data as CategoryEntity);
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

