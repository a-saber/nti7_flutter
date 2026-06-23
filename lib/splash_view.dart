import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti7_flutter/let_start_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((v){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LetStartView()),
      );
    });
    super.initState();
  }

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
            SizedBox(height: 44.h),
            Text(
              'TODO',
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w900,
                color: Color(0xff149954),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
