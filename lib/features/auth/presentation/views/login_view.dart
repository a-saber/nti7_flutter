import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/core/helper/app_validator.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:nti7_flutter/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:nti7_flutter/home.dart';
import 'package:nti7_flutter/login_response_model.dart';
import 'package:nti7_flutter/features/auth/presentation/views/register_view.dart';

import '../../../../core/components/custom_btn.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/helper/show_snack_bar.dart';
import '../../../../dio_helper.dart';
import '../../../../let_start_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final username = TextEditingController();

  final password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:
        [
          DefaultImage(),
          SizedBox(height: 23.h,),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: username,
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  validator: AppValidator.validateRequired,
                ),
                SizedBox(height: 10.h,),
                BlocProvider(
                  create: (context) => LoginCubit(),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomTextField(
                        controller: password,
                        obscureText: LoginCubit.get(context).passwordSecure,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: LoginCubit.get(context).changePasswordSecure,
                            icon: Icon(Icons.lock_open)),
                      );
                    }
                  ),
                ),
                SizedBox(height: 23.h,),

                // SizedBox(height: 20,),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Color(0xff149954),
                //         foregroundColor: Colors.white,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(15.r)
                //         ),
                //         elevation: 10,
                //         shadowColor: Color(0xff149954)
                //       ),
                //       onPressed:  isLoading? null : onLoginPressed, child: Text('Login')),
                // ),
                if(isLoading)
                  CircularProgressIndicator()
                else
                  CustomBtn(
                    text: 'Login',
                    onTap: isLoading? null : onLoginPressed,
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
      ),
    );
  }

  onLoginPressed() async{
    print('start calling api');
    setState(() {
      isLoading = true;
    });
    await login();
    setState(() {
      isLoading = false;
    });
  }

  Future login() async {
    try {

      var response = await dio.post('login',
          data: FormData.fromMap({'username': username.text, 'password': password.text}));

      var mapResponse = response.data as Map<String, dynamic>;

      LoginResponseModel loginResponseModel =
      LoginResponseModel.fromJson(mapResponse);
      print(response.toString());
      showCustomSnackBar(context, text: 'Login Successfully\nWelcome', status: SnackBarStatus.success);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> HomeView(
            username: loginResponseModel.user?.username,
            imagePath: loginResponseModel.user?.imagePath,
            accessToken: loginResponseModel.accessToken!,
          )),
          (r)=> false);
    } catch (e) {
      handleDioException(e, context);
    }
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
