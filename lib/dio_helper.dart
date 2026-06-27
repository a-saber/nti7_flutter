import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nti7_flutter/core/helper/snack_bar.dart';

Dio dio = Dio(BaseOptions(
    baseUrl: 'https://ntitodo-production-3c33.up.railway.app/api/'));




handleDioException(Object e, BuildContext context) {
  if (e is DioException) {
    var errorResponse = e.response?.data as Map<String, dynamic>;
    var errorMsg = errorResponse['message'];
    showCustomSnackBar(context, text: errorMsg, status: SnackBarStatus.fail);
    print(errorResponse.toString());
    print(errorMsg);
  } else {
    print(e.toString());
  }
}