import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti7_flutter/login_view.dart';

class LetStartView extends StatelessWidget {
  const LetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/onboarding.svg', height: 342.h),
            SizedBox(height: 60.h),
            Text(
              'Welcome To \nDo It !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                color: Color(0xff24252C),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Ready to conquer your tasks? Let's Do It together.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff6E6A7C),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50.h),
            CustomBtn(
              text:  "Let's Start",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff149954),
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 0,
              color: Color(0xff149954),
            ),
          ],
        ),
        padding: REdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Center(
          child: Text(
           text,
            style: TextStyle(
              fontSize: 19.sp,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
