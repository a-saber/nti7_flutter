import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti7_flutter/features/auth/data/models/login_response_model.dart';
import 'package:nti7_flutter/features/auth/data/repo/auth_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  AuthRepo repo = AuthRepo();
  bool passwordSecure = true;

  void changePasswordSecure() {
    passwordSecure = !passwordSecure;
    emit(LoginPasswordSecureChangedState());
  }

  final username = TextEditingController();
  final password = TextEditingController();

  onLoginPressed() async {
    emit(LoginLoadingState());
    var result = await repo.login(
      username: username.text,
      password: password.text,
    );
    result.fold(
      (String errorMsg) {
        emit(LoginErrorState(errorMsg));
      },
      (UserModel u) {
        emit(LoginSuccessState());
      },
    );
  }
}
