import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/test_cubit/test_cubit.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/test_cubit/test_state.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> TestCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            return Column(
              children: [
                Text('Hello World', style: TextStyle(
                  color: TestCubit.get(context).color
                ),),
                ElevatedButton(onPressed: TestCubit.get(context).onBtnPressed, child: Text('Change Color')),
              ],
            );
          }
        ),
      ),
    );
  }
}
