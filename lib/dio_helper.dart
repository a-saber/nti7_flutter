import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(
    baseUrl: 'https://ntitodo-production-3c33.up.railway.app/api/'));




String handleDioException(Object e) {
  if (e is DioException) {
    var errorResponse = e.response?.data as Map<String, dynamic>;
    var errorMsg = errorResponse['message'];
    print(errorResponse.toString());
    print(errorMsg);
    return errorMsg;
  } else {
    print(e.toString());
    return 'Error Happened try again later';
  }
}