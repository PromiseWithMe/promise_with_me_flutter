import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/util/dio.dart';
import 'package:promise_with_me_flutter/presentation/view/splash/splash_screen.dart';

import 'core/util/socket.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  dioInit();
  connectSocketIo();

  runApp(MyApp(blocProvider: await di()));
}

class MyApp extends StatelessWidget {
  final List<BlocProvider> blocProvider;

  const MyApp({super.key, required this.blocProvider});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: ScreenUtilInit(
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
          home: SplashScreen(),
        ),
      ),
    );
  }
}
