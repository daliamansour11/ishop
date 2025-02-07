

import 'package:equatable/equatable.dart';

class LoginEntity extends   Equatable{

  String? token;
  LoginEntity({this.token});

  @override
  List<Object?> get props => [token];
}