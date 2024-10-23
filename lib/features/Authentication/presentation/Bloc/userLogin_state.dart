

  import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';

import '../../domain/entities/user_entity.dart';

abstract class UserState  extends Equatable{
  final LoginEntity? user_login;
  // final List<ProductsEntity>? searchedProducts;
  final DioException ? error;

  const UserState( { this.user_login, this.error,});
  @override
  List<Object?> get props =>[user_login,error];
}
class RemoteNewUserLoading extends UserState {
  const RemoteNewUserLoading();
}
class RemoteNewUserDone extends UserState{
  const RemoteNewUserDone(LoginEntity users):super(user_login:users);


}
class RemoteNewUserError extends UserState{
  const RemoteNewUserError(DioException error):super(error:error);

}
