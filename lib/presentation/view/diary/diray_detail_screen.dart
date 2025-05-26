import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/app_bar_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';

import '../../../core/componant/image_widget.dart';
import '../../../core/design_sys/sys_text.dart';
import '../../../core/util/navigators.dart';

class DiaryDetailScreen extends StatelessWidget {
  final String diary;
  final DateTime currentDate;

  const DiaryDetailScreen({
    super.key,
    required this.diary,
    required this.currentDate,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        // app_leading
        leading: GestureDetector(
          onTap: () => Navigators.pop(context),
          child: ImageWidget(image: SysImages.arrowLeft, imageWidth: 18.w),
        ),

        // app_title
        title: SysText.bodyMedium(
          text:
              "${currentDate.year}년 ${currentDate.month.toString().padLeft(2, '0')}월 ${currentDate.day.toString().padLeft(2, '0')}일",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: Column(children: [SysText.bodySmall(text: diary)]),
      ),
    );
  }
}
