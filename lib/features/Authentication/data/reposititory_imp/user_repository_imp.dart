

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ishop/core/resources/data_state.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository_interface/login_repository_interface.dart';
import '../data_source/user_apiService.dart';
import '../model/Login_response_model.dart';
import '../model/login_requestBody.dart';

class LoginRepositoryImp extends LoginRepository{
  final UserApiService loginApiService;
  LoginRepositoryImp(this.loginApiService);

  @override
  Future<DataState<LoginResponseModel>> userLogin(LoginRequestBody loginRequestBody) async{
try{
  final httpResponse = await loginApiService.user_login(loginRequestBody);
  if (httpResponse.response.statusCode == HttpStatus.ok) {
    print("wwwwwwwwwwwwwwww${loginRequestBody.email}");
    print("wwwwwwwwwwwwwwww${loginRequestBody.password}");
    print("wwwwwwwwwwwwwwww22222${httpResponse.data.data.token}");

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
}on DioException catch (e){
  print('Error occurred during API call: ${e.message}');
  return DataFailed(e);
}

  }}

