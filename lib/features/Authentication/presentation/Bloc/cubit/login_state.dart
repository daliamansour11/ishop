part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {

  final LoginRequestBody? user_login;
  final LoginResponseModel? data;
  // final List<ProductsEntity>? searchedProducts;
  final DioException ? error;

  const LoginState({this.data, this.user_login, this.error});
  @override
  List<Object?> get props =>[];
}


final class LoginInitial extends LoginState {
 const LoginInitial();
}



class RemoteNewUserLoading extends LoginState {
  const RemoteNewUserLoading();
}
class RemoteNewUserDone extends LoginState{
  const RemoteNewUserDone(LoginRequestBody users):super(user_login: users);


}
class RemoteNewUserError extends LoginState{
  const RemoteNewUserError(DioException error):super(error: error);

}
