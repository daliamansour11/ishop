import 'package:dio/dio.dart';
import 'package:ishop/core/network/base_apiService.dart';
import 'package:ishop/features/Authentication/data/model/login_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';
import '../model/userModel.dart';
part 'user_apiService.g.dart';


@RestApi(baseUrl: BASEURL)

abstract class UserApiService {

  factory UserApiService(Dio dio) = _UserApiService;
  // https://fakestoreapi.com/auth/login
  @POST("/auth/login")
  Future<HttpResponse<LoginResponseModel>> user_login({
    @Query("username") String? username,
    @Query("password") String? password,
  });
// @Query("country") String? country,

}