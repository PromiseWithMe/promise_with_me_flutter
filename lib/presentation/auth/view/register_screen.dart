import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/app_bar_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/login_screen.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/widget/auth_rich_text_widget.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/widget/auth_text_field_widget.dart';

import '../../../core/componant/button_widget.dart';
import '../../../core/componant/image_widget.dart';
import '../../../core/design_sys/sys_color.dart';
import '../../../core/design_sys/sys_images.dart';
import '../../../core/design_sys/sys_text.dart';
import '../../../core/util/navigators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordCompareController;

  late final FocusNode _nicknameNode;
  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  late final FocusNode _passwordCompareNode;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordCompareController = TextEditingController();

    _nicknameNode = FocusNode();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _passwordCompareNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCompareController.dispose();

    _nicknameNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _passwordCompareNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      /// AppBar
      appbar: AppBarWidget(
        // app_leading
        leading: GestureDetector(
          onTap: () => Navigators.pop(context),
          child: ImageWidget(image: SysImages.arrowLeft, imageWidth: 18.w),
        ),

        // app_title
        title: SysText.bodyMedium(text: "회원가입"),
      ),

      /// Body
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                // 닉네임
                AuthTextFieldWidget(
                  controller: _nicknameController,
                  node: _nicknameNode,
                  hintText: '닉네임',
                ),

                SizedBox(height: 20.h),

                // 이메일
                AuthTextFieldWidget(
                  controller: _emailController,
                  node: _emailNode,
                  hintText: '이메일',
                ),

                SizedBox(height: 20.h),

                // 비밀번호
                AuthTextFieldWidget(
                  controller: _passwordController,
                  node: _passwordNode,
                  hintText: '비밀번호',
                ),

                SizedBox(height: 20.h),

                // 비밀번호 확인
                AuthTextFieldWidget(
                  controller: _passwordCompareController,
                  node: _passwordCompareNode,
                  hintText: '비밀번호 재입력',
                ),

                SizedBox(height: 40.h),

                // 로그인 버튼
                ButtonWidget(
                  onTap: () {},
                  color: SysColor.green200,
                  borderRadius: 8.r,
                  text: SysText.bodyMedium(text: "회원가입", color: SysColor.white),
                  width: 390.w,
                  height: 58.h,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigators.go(context, LoginScreen()),
              child: AuthRichTextWidget(
                firstText: "나와의 약속을 사용했었다면?",
                secondText: "로그인",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
