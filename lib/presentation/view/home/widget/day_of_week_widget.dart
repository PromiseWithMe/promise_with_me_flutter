import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/day_of_week_cubit.dart';

class DayOfWeekWidget extends StatelessWidget {
  final int index;
  final MapEntry<String, bool> day;

  const DayOfWeekWidget({super.key, required this.index, required this.day});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () => context.read<DayOfWeekCubit>().toggleState(index),
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
