import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../dio_helper.dart';
import '../models/login_response_model.dart';

class AuthRepo {

  Future<Either<String, UserModel>> login({
    required String username,
    required String password
}) async {
    try {

      var response = await dio.post('login',
          data: FormData.fromMap({'username': username, 'password': password}));

      var mapResponse = response.data as Map<String, dynamic>;

      LoginResponseModel loginResponseModel =
      LoginResponseModel.fromJson(mapResponse);
      return right(loginResponseModel.user!);

    } catch (e) {
      return left(handleDioException(e));
    }
  }

}