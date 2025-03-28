import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;
  final String hintText;
  final Widget? errorWidget;
  final bool isObscure;

  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.node,
    required this.hintText,
    this.isObscure = false,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      focusNode: node,
      onTapOutside: (_) => node.unfocus(),
      style: TextStyle(
        fontFamily: "jua",
        fontSize: 20.sp,
        height: 24.sp / 20.sp,
        color: SysColor.black,
      ),
      obscuringCharacter: '⚇',
      cursorHeight: 20.h,
      cursorColor: SysColor.black,
      cursorErrorColor: SysColor.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "jua",
          fontSize: 20.sp,
          height: 24.sp / 20.sp,
          color: SysColor.gray300,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SysColor.green200),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SysColor.gray300),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SysColor.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SysColor.red),
        ),
        error: errorWidget,
      ),
    );
  }
}
