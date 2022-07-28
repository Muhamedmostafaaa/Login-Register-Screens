import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_task/constants/end_points.dart';

class DioHelper{
  static late Dio dio;
static init(){
  dio=Dio(
    BaseOptions(
      baseUrl:baseURL,
      receiveDataWhenStatusError: true
    )
  );

}
static Future<Response> postdata(
    {required String url, required Map<String, dynamic> data})async{
  return await dio.post(url,
    data:data
  );

}

}