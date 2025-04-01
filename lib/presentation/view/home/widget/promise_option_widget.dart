import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/componant/image_widget.dart';
import '../../../../core/design_sys/sys_text.dart';

class PromiseOptionWidget extends StatelessWidget {
  final String image, title;

  const PromiseOptionWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          ImageWidget(image: image, imageWidth: 24.w),
          SizedBox(width: 20.w),
          SysText.bodyMedium(text: title),
        ],
      ),
    );
  }
}
