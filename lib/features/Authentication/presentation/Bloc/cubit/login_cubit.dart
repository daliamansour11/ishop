import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/util/SharedPreferenceInfo.dart';
import '../../../data/model/Login_response_model.dart';
import '../../../data/model/login_requestBody.dart';
import '../../../data/reposititory_imp/user_repository_imp.dart';
import '../../../domain/entities/login_entity.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepositoryImp? loginRepo;
  LoginCubit(  this.loginRepo):super(const LoginInitial()){
    // on<LoginUserEvent>(onUserLogIn);
  }


  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final formKey=GlobalKey<FormState>();


Future<DataState<LoginResponseModel>>  onUserLogIn(LoginRequestBody loginRequestBody) async {
    final loginResponse = await loginRepo!.userLogin(loginRequestBody);


    print("we are hereeeeeeeeeeee655 ${loginRequestBody.email!}");
    if(loginResponse is DataSuccess) {
      print("we are hereeeeeeeeeeee6555 ${loginRequestBody.password!}");
      print("we are hereeeeeeeeeeee56666666 ${loginResponse.data!.data.username}");

      SharedPreferencesInfo.saveUserTokenToSF(loginResponse.data!.data.token);
      SharedPreferencesInfo.saveUsernameToSF(loginResponse.data!.data.username);

      SharedPreferencesInfo
          .saveUserLoggedInStatus(
          loginResponse.data!.status);

      String? t = await SharedPreferencesInfo.getUserTokenFromSF();
      print("${t}Tokennnnnnnnnnnnnnn");


      emit(RemoteNewUserDone(loginRequestBody));
    }
   else if (loginResponse is DataFailed) {
      if (loginResponse!.error != null) {
        if (loginResponse.error is DioException) {
          DioException dioError = loginResponse.error as DioException;
          String errorMessage = dioError.message ??
              "An error occurred, but no message was provided";

          // print("Error Type: ${dioError.type}");
          if (dioError.response != null) {
            print("Response status message: ${dioError.response?.statusMessage}");
            print("Response data: ${dioError.response?.data}");
          }
          if (dioError.error != null) {
            print("Underlying error: ${dioError.error}");
          }
          print("hereeeeeeeeeeeee${loginResponse.error!.message}");
          emit(RemoteNewUserError(loginResponse.error!));

        }

//aa@aa.com passwordddd
      }
    }
return loginResponse;

  }

}
