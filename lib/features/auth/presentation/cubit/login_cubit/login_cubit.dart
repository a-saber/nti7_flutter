import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(): super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool passwordSecure = true;
  void changePasswordSecure(){
    passwordSecure = !passwordSecure;
    emit(LoginPasswordSecureChangedState());
  }

}