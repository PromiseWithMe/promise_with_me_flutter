import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/image_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promise_entity.dart';

import '../../../../core/design_sys/sys_color.dart';
import '../../../../core/design_sys/sys_text.dart';

class PromiseWidget extends StatelessWidget {
  final PromiseEntity promise;

  const PromiseWidget({super.key, required this.promise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: SysColor.green100,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SysText.bodyMedium(text: promise.title, color: SysColor.white),

              SizedBox(height: 4.h),

              SysText.bodyTiny(
                text: promise.getDayOfWeek,
                color: SysColor.white,
              ),
            ],
          ),

          Row(
            children: [
              Builder(
                builder: (context) {
                  if (promise.getPromiseState == null) {
                    return SizedBox.shrink();
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: SysColor.white,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: SysText.bodyTiny(
                      text: promise.getPromiseState!,
                      color: SysColor.green200,
                    ),
                  );
                },
              ),

              SizedBox(width: 12.w),

              ImageWidget(image: SysImages.dotsVertical, imageWidth: 24.w),
            ],
          ),
        ],
      ),
    );
  }
}
