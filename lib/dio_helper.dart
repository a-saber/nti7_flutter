import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio dio = Dio(BaseOptions(
    baseUrl: 'https://ntitodo-production-3c33.up.railway.app/api/'));




handleDioException(Object e, BuildContext context) {
  if (e is DioException) {
    var errorResponse = e.response?.data as Map<String, dynamic>;
    var errorMsg = errorResponse['message'];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white,),
            SizedBox(width: 10,),
            Text(errorMsg, style: TextStyle(
                color: Colors.white
            ),),
          ],
        )));
    print(errorResponse.toString());
    print(errorMsg);
  } else {
    print(e.toString());
  }
}