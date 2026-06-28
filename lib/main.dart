import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/core/utils/app_colors.dart';

import 'home.dart';
import 'splash_view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            fontFamily: 'Lexend_Deca',
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          home: SplashView(),
        );
      },
    );
  }
}


























