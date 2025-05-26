import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/componant/image_widget.dart';
import '../../../core/design_sys/sys_images.dart';

class DiaryDetailAppBar extends StatelessWidget {
  const DiaryDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ImageWidget(image: SysImages.arrowLeft, imageWidth: 100.w)],
      ),
    );
  }
}
