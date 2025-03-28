import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/componant/app_bar_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/componant/toast_widget.dart';
import 'package:promise_with_me_flutter/data/dto/auth/request/register_request.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/login_screen.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/widget/auth_rich_text_widget.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/widget/auth_text_field_widget.dart';
import 'package:promise_with_me_flutter/presentation/auth/view/widget/error_text.dart';
import 'package:promise_with_me_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:promise_with_me_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    _nicknameController =
        TextEditingController()..addListener(() => setState(() {}));
    _emailController =
        TextEditingController()..addListener(() => setState(() {}));
    _passwordController =
        TextEditingController()..addListener(() => setState(() {}));
    _passwordCompareController =
        TextEditingController()..addListener(() => setState(() {}));

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
    BlocState authState = context.watch<AuthBloc>().state;

    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final nicknameErrorState = _nicknameController.text.isEmpty;
    final emailErrorState = !regex.hasMatch(_emailController.text);
    final passwordErrorState =
        _passwordController.text.isEmpty ||
        _passwordCompareController.text.isEmpty ||
        _passwordController.text != _passwordCompareController.text;

    return BlocListener<AuthBloc, BlocState>(
      listenWhen: (_, state) => state.blocState == BlocStateEnum.error,
      listener: (context, state) {
        showTopSnackBar(
          Overlay.of(context),
          ToastWidget(title: "REGISTER ERROR"),
        );
      },
      child: ScaffoldWidget(
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
                    errorWidget: errorText(
                      errorText: "닉네임은 필수 사항입니다.",
                      state: nicknameErrorState,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // 이메일
                  AuthTextFieldWidget(
                    controller: _emailController,
                    node: _emailNode,
                    hintText: '이메일',
                    errorWidget: errorText(
                      errorText: '이메일 형식으로 입력해주세요.',
                      state: emailErrorState,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // 비밀번호
                  AuthTextFieldWidget(
                    controller: _passwordController,
                    node: _passwordNode,
                    hintText: '비밀번호',
                    errorWidget: errorText(
                      errorText: '비밀번호 재입력과 일치하지 않습니다.',
                      state: passwordErrorState,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // 비밀번호 확인
                  AuthTextFieldWidget(
                    controller: _passwordCompareController,
                    node: _passwordCompareNode,
                    hintText: '비밀번호 재입력',
                    errorWidget: errorText(
                      errorText: '비밀번호와 일치하지 않습니다.',
                      state: passwordErrorState,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // 회원가입 버튼
                  ButtonWidget(
                    isLoading: authState.blocState == BlocStateEnum.loading,
                    loadingIndicatorColor: SysColor.white,
                    onTap: () {
                      if (!nicknameErrorState &&
                          !emailErrorState &&
                          !passwordErrorState) {
                        context.read<AuthBloc>().add(
                          RegisterEvent(
                            registerRequest: RegisterRequest(
                              nickname: _nicknameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          ),
                        );
                      }
                    },
                    color: SysColor.green200,
                    borderRadius: 8.r,
                    text: SysText.bodyMedium(
                      text: "회원가입",
                      color: SysColor.white,
                    ),
                    width: 390.w,
                    height: 58.h,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigators.pushReplacement(context, LoginScreen());
                },
                child: AuthRichTextWidget(
                  firstText: "나와의 약속을 사용했었다면?",
                  secondText: "로그인",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
