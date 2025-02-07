// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  String message;
  Data data;
  bool status;
  int code;

  LoginResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    status: json["status"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "status": status,
    "code": code,
  };
}

class Data {
  String token;
  String username;

  Data({
    required this.token,
    required this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "username": username,
  };
}
