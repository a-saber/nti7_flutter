import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'test_state.dart';

class TestCubit extends Cubit<TestState>{

  TestCubit(): super(TestInitState());
  static TestCubit get(context) => BlocProvider.of(context);


  Color color = Colors.black;
  onBtnPressed(){
    color = Colors.red;
    emit(TestChangeColorState());
  }
}