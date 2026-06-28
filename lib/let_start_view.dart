import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti7_flutter/core/components/custom_svg.dart';
import 'package:nti7_flutter/core/utils/app_assets.dart';
import 'package:nti7_flutter/features/auth/presentation/views/login_view.dart';

import 'core/components/custom_btn.dart';

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
            CustomSvg(path: AppSVG.onboarding, height: 342.h),
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
                  // goTo()
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

