import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';

class DayOfWeekWidget extends StatelessWidget {
  final int index;
  final MapEntry<String, bool> day;
  final GestureTapCallback onTap;

  const DayOfWeekWidget({
    super.key,
    required this.index,
    required this.day,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: 52.w,
            height: 44.h,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: day.value ? SysColor.green200 : SysColor.green50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SysText.bodyTiny(
              text: day.key,
              color: day.value ? SysColor.white : SysColor.black,
            ),
          ),
        );
      },
    );
  }
}
