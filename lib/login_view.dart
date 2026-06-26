import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/home.dart';
import 'package:nti7_flutter/login_response_model.dart';

import 'dio_helper.dart';
import 'let_start_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final username = TextEditingController();

  final password = TextEditingController();

  bool passwordSecure = true;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:
        [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
            ),
            child: Image.asset('assets/images/flag.png',
              width: double.infinity,
            height: 300.h,
              fit: BoxFit.cover,

            ),
          ),
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
      showSuccessSnackBar(context, 'Login Successfully\nWelcome');
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


showSuccessSnackBar(context, String text)=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color(0xff149954),
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white,),
        SizedBox(width: 10,),
        Text(text, style: TextStyle(
            color: Colors.white
        ),),
      ],
    )));

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText, this.prefixIcon, this.suffixIcon, this.obscureText = false});
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14.sp
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color(0xffCDCDCD),
              )
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 14.sp,
              fontWeight: FontWeight.w200
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color(0xffCDCDCD),
              )
          )
      ),
    );
  }
}

