import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  'assets/images/logo.svg',
                height: 343.h,
                width: 334.w,
              ),
              SizedBox(height: 44.h,),
              Text('TODO', style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w900,
                color: Color(0xff149954)
              ),)
            ],
          )),
    );
  }
}
