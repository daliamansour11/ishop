


import 'package:dio/dio.dart';
import 'package:ishop/features/Authentication/data/data_source/user_apiService.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/useCase.dart';
import '../../data/reposititory_imp/user_repository_imp.dart';


class LogedInUseCase implements UseCase<DataState<LoginEntity>,void>{

   UesrLogedInRepositoryImp user_loginRepository;
  String? username;String? password;
  LogedInUseCase( this.user_loginRepository,this.username,this.password,);
  @override
  Future <DataState<LoginEntity>>call({void params}){

    return user_loginRepository.UserLogingIn();

  }

}