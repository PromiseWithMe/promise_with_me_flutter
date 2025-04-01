import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/promise_option_widget.dart';

class PromiseOptionBottomSheet extends StatefulWidget {
  const PromiseOptionBottomSheet({super.key});

  @override
  State<PromiseOptionBottomSheet> createState() =>
      _PromiseOptionBottomSheetState();
}

class _PromiseOptionBottomSheetState extends State<PromiseOptionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 60.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PromiseOptionWidget(image: SysImages.star, title: "완료하기"),

          SizedBox(height: 10.h),

          PromiseOptionWidget(image: SysImages.skip, title: "오늘은 스킵"),

          SizedBox(height: 10.h),

          PromiseOptionWidget(image: SysImages.pencil, title: "수정하기"),

          SizedBox(height: 10.h),

          PromiseOptionWidget(image: SysImages.trash, title: "삭제하기"),
        ],
      ),
    );
  }
}
