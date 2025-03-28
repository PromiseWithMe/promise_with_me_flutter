import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/componant/image_widget.dart';
import '../../../../core/design_sys/sys_images.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageWidget(image: SysImages.logoInline, imageWidth: 100.w),
          Row(
            children: [
              ImageWidget(image: SysImages.plus, imageWidth: 26.w),
              SizedBox(width: 20.w),
              ImageWidget(image: SysImages.filter, imageWidth: 26.w),
            ],
          ),
        ],
      ),
    );
  }
}
