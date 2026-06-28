import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/core/helper/app_validator.dart';
import 'package:nti7_flutter/core/helper/my_navigator.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:nti7_flutter/home.dart';
import 'package:nti7_flutter/features/auth/data/models/login_response_model.dart';
import 'package:nti7_flutter/features/auth/presentation/views/register_view.dart';

import '../../../../core/components/custom_btn.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/helper/show_snack_bar.dart';
import '../../../../dio_helper.dart';
import '../../../../let_start_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state){
            if(state is LoginErrorState){
              showCustomSnackBar(context, text: state.error, status: SnackBarStatus.fail);
            }
            else if(state is LoginSuccessState){
              showCustomSnackBar(context, text: "Login Success\nWelcome", status: SnackBarStatus.success);
              // goTo(context, page: HomeView(username: username, imagePath: imagePath, accessToken: accessToken));
            }
          },
          builder: (context, state) {
            return Column(
              children:
              [
                DefaultImage(),
                SizedBox(height: 23.h,),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: LoginCubit.get(context).username,
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        validator: AppValidator.validateRequired,
                      ),
                      SizedBox(height: 10.h,),
                      CustomTextField(
                        controller: LoginCubit.get(context).password,
                        obscureText: LoginCubit.get(context).passwordSecure,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: LoginCubit.get(context).changePasswordSecure,
                            icon: Icon(Icons.lock_open)),
                      ),
                      SizedBox(height: 23.h,),

                      if(state is LoginLoadingState)
                        CircularProgressIndicator()
                      else
                        CustomBtn(
                          text: 'Login',
                          onTap: LoginCubit.get(context).onLoginPressed,
                        ),

                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t  have an account'),
                          SizedBox(width: 10,),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterView()));
                          }, child: Text('Register'))
                        ],
                      )


                      // LinearProgressIndicator(),

                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }



}





class DefaultImage extends StatelessWidget {
  const DefaultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
      child: Image.asset('assets/images/flag.png',
        width: double.infinity,
        height: 300.h,
        fit: BoxFit.cover,

      ),
    );
  }
}
