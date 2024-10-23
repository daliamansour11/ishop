import 'package:ishop/core/resources/data_state.dart';

import '../entities/login_entity.dart';
import '../entities/user_entity.dart';

abstract class UserRepository{
  Future<DataState<LoginEntity>> UserLogingIn({String username,String password});

}