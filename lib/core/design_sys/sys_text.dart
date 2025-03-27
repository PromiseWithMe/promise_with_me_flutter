import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';

final String _fontFamily = "jua";

class SysText {
  static Text bodyLarge({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.sp,
        height: 26.sp / 24.sp,
        color: color ?? SysColor.black,
      ),
    );
  }

  static Text bodyMedium({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.sp,
        height: 24.sp / 20.sp,
        color: color ?? SysColor.black,
      ),
    );
  }

  static Text bodySmall({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.sp,
        height: 21.6.sp / 18.sp,
        color: color ?? SysColor.black,
      ),
    );
  }

  static Text bodyTiny({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        height: 19.2.sp / 16.sp,
        color: color ?? SysColor.black,
      ),
    );
  }

  static Text bodyMini({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        height: 14.4.sp / 12.sp,
        color: color ?? SysColor.black,
      ),
    );
  }
}
