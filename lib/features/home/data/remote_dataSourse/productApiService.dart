





import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';
import '../models/products.dart';



part 'productApiService.g.dart';

@RestApi(baseUrl: BASEURL)

 abstract class ProductApiService {


 factory ProductApiService(Dio dio) = _ProductApiService;

 @GET("/products")
 Future<HttpResponse<List<ProductModel>>> getAllProducts( );
   // @Query("apiKey") String? apiKey,
   // @Query("country") String? country,

 @GET("/products/categories")
 Future<HttpResponse<List<String>>> getNewsCategory( );
// @Query("apiKey") String? apiKey,
// @Query("country") String? country,
// /users
 @GET("/products/categories")
 Future<HttpResponse<List<ProductModel>>> getproducts_category(
     @Query("category") String? category);
// @Query("country") String? country,


}

