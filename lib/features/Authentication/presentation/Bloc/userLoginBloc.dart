import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/features/Authentication/data/model/login_requestBody.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLogin_event.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLogin_state.dart';
import 'package:ishop/features/Authentication/presentation/pages/login/screens/LoginScreen.dart';

import '../../../../../core/resources/data_state.dart';
import '../../data/reposititory_imp/user_repository_imp.dart';
import '../../domain/user_useCase/logedIn_UseCase.dart';

class UserLogInBloc extends Bloc<LoginUserEvent, UserState> {
  final LoginRepositoryImp loginRepo;
  LoginRequestBody loginRequestBody;
  UserLogInBloc(  this.loginRepo,this.loginRequestBody):super(const RemoteNewUserLoading()){
    // on<LoginUserEvent>(onUserLogIn);
  } 
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final formKey=GlobalKey<FormState>();
  

  void onUserLogIn(LoginRequestBody loginRequestBody) async {
    final login_bloc = await loginRepo.userLogin(loginRequestBody);

      print("we are hereeeeeeeeeeee555 ${loginRequestBody.email}");


      if (login_bloc is DataFailed) {
        if (login_bloc.error != null) {
          if (login_bloc.error is DioException) {
            DioException dioError = login_bloc.error as DioException;
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
            print("hereeeeeeeeeeeee${login_bloc.error!.message}");
            emit(RemoteNewUserError(login_bloc.error!));          }
//aa@aa.com passwordddd
        }
      }
    }

  }

