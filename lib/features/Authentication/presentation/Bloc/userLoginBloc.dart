import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLogin_event.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLogin_state.dart';

import '../../../../../core/resources/data_state.dart';
import '../../data/reposititory_imp/user_repository_imp.dart';
import '../../domain/user_useCase/logedIn_UseCase.dart';

class UserLogInBloc extends Bloc<LoginUserEvent, UserState> {
  final UesrLogedInRepositoryImp user_repo;
 final LogedInUseCase logedInUseCase;
  UserLogInBloc(  this.user_repo, this.logedInUseCase):super(const RemoteNewUserLoading()) {
    on<LoginUserEvent>(onUserLogIn);
  }
  void onUserLogIn(LoginUserEvent event, Emitter<UserState> emitter) async {
    final dataState = await logedInUseCase();
    final user = await user_repo.UserLogingIn(username: event.name, password: event.password,);
      print("we are hereeeeeeeeeeee555 ${user.data}");

    if(dataState is DataSuccess ){

      print("we are hereeeeeeeeeeee555 ${dataState.data}");
      emit(RemoteNewUserDone(user.data!));

      if (user is DataFailed) {
        if (user.error != null) {
          if (user.error is DioException) {
            DioException dioError = user.error as DioException;
            String errorMessage = dioError.message ??
                "An error occurred, but no message was provided";

            print("Error Type: ${dioError.type}");
            if (dioError.response != null) {
              print("Response status code: ${dioError.response?.statusCode}");
              print("Response status message: ${dioError.response?.statusMessage}");
              print("Response data: ${dioError.response?.data}");
            }
            if (dioError.error != null) {
              print("Underlying error: ${dioError.error}");
            }
            print("hereeeeeeeeeeeee${user.error!.message}");
            emit(RemoteNewUserError(user.error!));
          }

        }
      }
    }
  }
}
