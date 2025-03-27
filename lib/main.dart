import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            titleSpacing: 0,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen()
      ),
    );
  }
}
