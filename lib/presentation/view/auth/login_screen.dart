import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/componant/app_bar_widget.dart';
import 'package:promise_with_me_flutter/core/componant/button_widget.dart';
import 'package:promise_with_me_flutter/core/componant/image_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/componant/toast_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/data/dto/auth/login_request.dart';
import 'package:promise_with_me_flutter/presentation/view/auth/register_screen.dart';
import 'package:promise_with_me_flutter/presentation/view/auth/widget/auth_rich_text_widget.dart';
import 'package:promise_with_me_flutter/presentation/view/auth/widget/auth_text_field_widget.dart';
import 'package:promise_with_me_flutter/presentation/view/auth/widget/error_text.dart';
import 'package:promise_with_me_flutter/presentation/view/splash/splash_screen.dart';
import 'package:promise_with_me_flutter/presentation/view_model/auth/auth_bloc.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/util/token_storage.dart';
import '../../view_model/auth/auth_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;

  @override
  void initState() {
    super.initState();
    _emailController =
        TextEditingController()..addListener(() => setState(() {}));
    _passwordController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _emailNode.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocState authState = context.watch<AuthBloc>().state;

    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final emailErrorState = !regex.hasMatch(_emailController.text);

    return MultiBlocProvider(
      providers: [
        BlocListener<AuthBloc, BlocState>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.error,
          listener: (context, state) {
            showTopSnackBar(
              Overlay.of(context),
              ToastWidget(title: "아이디 또는 비밀번호가 일치하지 않습니다."),
            );
          },
        ),

        BlocListener<AuthBloc, BlocState>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.loaded,
          listener: (context, _) => Navigators.go(context, SplashScreen()),
        ),
      ],
      child: ScaffoldWidget(
        /// AppBar
        appbar: AppBarWidget(
          // app_leading
          leading: GestureDetector(
            onTap: () => Navigators.pop(context),
            child: ImageWidget(image: SysImages.arrowLeft, imageWidth: 18.w),
          ),

          // app_title
          title: SysText.bodyMedium(text: "로그인"),
        ),

        /// Body
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
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
                    isObscure: true,
                  ),

                  SizedBox(height: 40.h),

                  // 로그인 버튼
                  ButtonWidget(
                    isLoading: authState.blocState == BlocStateEnum.loading,
                    loadingIndicatorColor: SysColor.white,
                    onTap: () async {
                      if (!emailErrorState) {
                        final deviceToken =
                            await TokenStorage.findDeviceToken();
                        if (context.mounted) {
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              loginRequest: LoginRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                                deviceToken: deviceToken ?? "",
                              ),
                            ),
                          );
                        }
                      }
                    },
                    color: SysColor.green200,
                    borderRadius: 8.r,
                    text: SysText.bodyMedium(
                      text: "로그인",
                      color: SysColor.white,
                    ),
                    width: 390.w,
                    height: 58.h,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigators.pushReplacement(context, RegisterScreen());
                },
                child: AuthRichTextWidget(
                  firstText: "나와의 약속이 처음이라면?",
                  secondText: "회원가입",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
