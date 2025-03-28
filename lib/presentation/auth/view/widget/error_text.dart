import 'package:flutter/material.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';

Text? errorText({required String errorText, required bool state}) {
  if (state) {
    return SysText.bodyTiny(text: errorText, color: SysColor.red);
  }

  return null;
}
