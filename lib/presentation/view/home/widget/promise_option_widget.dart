import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/componant/image_widget.dart';
import '../../../../core/design_sys/sys_text.dart';

class PromiseOptionWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String image, title;

  const PromiseOptionWidget({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            ImageWidget(image: image, imageWidth: 24.w),
            SizedBox(width: 20.w),
            SysText.bodyMedium(text: title),
          ],
        ),
      ),
    );
  }
}
