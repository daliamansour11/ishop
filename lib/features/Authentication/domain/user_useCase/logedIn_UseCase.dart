


import 'package:dio/dio.dart';
import 'package:ishop/features/Authentication/data/model/login_requestBody.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/useCase.dart';
import '../../data/reposititory_imp/user_repository_imp.dart';

//
// class LoginUseCase implements UseCase<DataState<LoginEntity>,void>{
//
//   LoginRepositoryImp  loginRepository;
//     final  LoginRequestBody loginRequestBody;
//   LogedInUseCase( this.user_loginRepository, this.loginRequestBody);
//   @override
//   Future <DataState<LoginEntity>>call({void params}){
//
//     return user_loginRepository.UserLogingIn(loginRequestBody) ;
//
//   }
//
// }