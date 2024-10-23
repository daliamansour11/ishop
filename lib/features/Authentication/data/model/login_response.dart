

import 'package:flutter/foundation.dart';

import '../../domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity{


  LoginResponseModel({ String ?token});

  factory LoginResponseModel.fromJson(Map<String,dynamic>json)=>LoginResponseModel(

      token: json["token"],
      );
Map<String,dynamic>tojson()=>{
  "token":token,
};


}