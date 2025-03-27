import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/button_widget.dart';
import 'package:promise_with_me_flutter/core/componant/image_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/register_screen.dart';
import '../auth/view/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundColor: SysColor.green200,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: ImageWidget(image: SysImages.logo, color: SysColor.white),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  onTap: () => Navigators.push(context, LoginScreen()),
                  width: 1.sw - 40.w,
                  height: 58.h,
                  borderRadius: 8.r,
                  leftLeading: ImageWidget(
                    image: SysImages.clover,
                    color: SysColor.white,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  border: Border.all(color: SysColor.white),
                  text: SysText.bodyMedium(text: "로그인", color: SysColor.white),
                ),

                SizedBox(height: 10.h),

                ButtonWidget(
                  onTap: () => Navigators.push(context, RegisterScreen()),
                  width: 1.sw - 40.w,
                  height: 58.h,
                  borderRadius: 8.r,
                  rightLeading: ImageWidget(
                    image: SysImages.clover,
                    color: SysColor.white,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                  border: Border.all(color: SysColor.white),
                  text: SysText.bodyMedium(text: "회원가입", color: SysColor.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
