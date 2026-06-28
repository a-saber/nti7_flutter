import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/dio_helper.dart';

import '../../../../core/components/custom_btn.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/helper/show_snack_bar.dart';
import '../../../../let_start_view.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final username = TextEditingController();

  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  bool passwordSecure = true;
  bool passwordConfirmSecure = true;

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
                ),
                SizedBox(height: 10.h,),
                CustomTextField(
                  controller: password,
                  obscureText: passwordSecure,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      passwordSecure = !passwordSecure;
                    });
                  }, icon: Icon(Icons.lock_open)),
                ),
                SizedBox(height: 10.h,),
                CustomTextField(
                  controller: passwordConfirm,
                  obscureText: passwordConfirmSecure,
                  hintText: 'Password Confirm',
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      passwordSecure = !passwordSecure;
                    });
                  }, icon: Icon(Icons.lock_open)),
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
                    text: 'Register',
                    onTap: isLoading? null : onRegisterPressed,
                  ),


                // LinearProgressIndicator(),

              ],
            ),
          )
        ],
      ),
    );
  }

  onRegisterPressed()async {
    setState(() {
      isLoading = true;
    });

    // TODO: implement formKey validation

    // implement api
    await registerApi();

    setState(() {
      isLoading = false;
    });
  }

  Future registerApi()async{
    try{
      var result = await dio.post('register',
        data: FormData.fromMap({
          'username': username.text,
          'password': password.text,
          // 'image': ,
        })
      );
      var mapResponse = result.data as Map<String, dynamic>;
      String successMsg = mapResponse['message'];
      showCustomSnackBar(context, text: successMsg, status: SnackBarStatus.success);

      Navigator.pop(context);

    }catch(e){
      handleDioException(e, context);
    }
  }
}
