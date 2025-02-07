


import 'package:dio/dio.dart';

abstract class NetworkApi{

  Future<dynamic>get(String path,
      Object ?data,
      Map<String,dynamic>?queryParams,
      );
  Future<dynamic>  post(
      String path,
      Object ?data,
      Map<String,dynamic>?queryParams,
      );
  Future<dynamic> datch(
      String path,
      Object ?data,
      Map<String,dynamic>?queryParams,
      );
  Future<dynamic> delete(
      String path,
      Object ?data,
      Map<String,dynamic>?queryParams,
      ) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}