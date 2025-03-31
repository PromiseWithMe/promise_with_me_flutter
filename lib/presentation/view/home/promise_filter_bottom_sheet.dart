import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/core/componant/button_widget.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/day_of_week_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_filter_cubit.dart';

import '../../../core/design_sys/sys_color.dart';
import '../../../core/design_sys/sys_text.dart';
import '../../view_model/promise/promise_bloc.dart';

class PromiseFilterBottomSheet extends StatefulWidget {
  const PromiseFilterBottomSheet({super.key});

  @override
  State<PromiseFilterBottomSheet> createState() =>
      _PromiseFilterBottomSheetState();
}

class _PromiseFilterBottomSheetState extends State<PromiseFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PromiseFilterCubit(),
      child: BlocBuilder<PromiseFilterCubit, List<MapEntry<String, bool>>>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: SysColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DayOfWeek
                  SysText.bodyTiny(text: "요일"),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(state.length, (index) {
                      return DayOfWeekWidget(
                        onTap:
                            () => context
                                .read<PromiseFilterCubit>()
                                .toggleState(index),
                        index: index,
                        day: state[index],
                      );
                    }),
                  ),

                  SizedBox(height: 40.h),

                  // Create Button
                  ButtonWidget(
                    onTap: () {
                      context.read<PromiseBloc>().add(
                        GetPromisesEvent(
                          getPromisesRequest: GetPromisesRequest(
                            page: 0,
                            dayOfWeek:
                                context
                                    .read<PromiseFilterCubit>()
                                    .dayOfWeekAsRequest(),
                          ),
                        ),
                      );
                      // context.read<PromiseBloc>().add(
                      //   CreatePromiseEvent(
                      //     createPromiseRequest: CreatePromiseRequest(
                      //       title: titleController.text,
                      //       dayOfWeek:
                      //       context
                      //           .read<DayOfWeekCubit>()
                      //           .dayOfWeekAsRequest(),
                      //     ),
                      //   ),
                      // );
                      Navigators.pop(context);
                    },
                    color: SysColor.green200,
                    borderRadius: 8.r,
                    text: SysText.bodyMedium(text: "생성", color: SysColor.white),
                    width: 1.sw - 40.w,
                    height: 58.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
