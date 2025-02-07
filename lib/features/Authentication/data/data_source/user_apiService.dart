import 'package:dio/dio.dart';
import 'package:ishop/features/Authentication/data/model/Login_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/constants.dart';
import '../model/login_requestBody.dart';


part'user_apiService.g.dart';
@RestApi(baseUrl: Login_BaseUrl)

abstract class UserApiService {

  factory UserApiService(Dio dio) = _UserApiService;
  @POST("/auth/login")
  Future<HttpResponse<LoginResponseModel>> user_login(
   LoginRequestBody loginRequestBody
  );

}