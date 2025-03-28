import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';

class ToastWidget extends StatelessWidget {
  final String title;
  final bool isError;

  const ToastWidget({super.key, required this.title, this.isError = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Builder(
        builder: (_) {
          if (!isError) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: const Color(0xFFE4E6EB),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SysText.bodyMedium(text: title),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: const Color(0xFFF5E8E6),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SysText.bodyMedium(text: title),
            );
          }
        },
      ),
    );
  }
}
