import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';

import '../../../../core/design_sys/sys_text.dart';

class CommandWidget extends StatelessWidget {
  final String command;
  final GestureTapCallback onTap;

  const CommandWidget({super.key, required this.command, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        color: SysColor.white,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: SysText.bodyMedium(text: command),
      ),
    );
  }
}
