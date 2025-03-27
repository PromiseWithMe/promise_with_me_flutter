import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';

class AuthRichTextWidget extends StatelessWidget {
  final String firstText, secondText;

  const AuthRichTextWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
              fontFamily: "jua",
              fontSize: 16.sp,
              height: 19.2.sp / 16.sp,
              color: SysColor.black,
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              fontFamily: "jua",
              fontSize: 16.sp,
              height: 19.2.sp / 16.sp,
              color: SysColor.green200,
            ),
          ),
        ],
      ),
    );
  }
}
