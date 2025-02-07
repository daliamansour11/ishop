import 'package:ishop/core/resources/data_state.dart';

import '../../data/model/Login_response_model.dart';
import '../../data/model/login_requestBody.dart';

abstract class LoginRepository{
  Future<DataState<LoginResponseModel>> userLogin(  LoginRequestBody loginRequestBody);

}