

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ishop/core/resources/data_state.dart';
import 'package:ishop/features/Authentication/data/data_source/user_apiService.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository_imp/user_repository.dart';

class UesrLogedInRepositoryImp extends UserRepository{
 final UserApiService userApiService ;
 UesrLogedInRepositoryImp(this.userApiService);
  @override
  Future<DataState<LoginEntity>> UserLogingIn({String? username,String? password,})async {
    try {
      print("weeeeeeeeeeeeeeeeeeeeee${password}");
      final httpResponse = await userApiService.user_login(username: username,password: password);
      // Check if the status code is OK (200)
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("wwwwwwwwwwwwwwww${httpResponse.data}");
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

