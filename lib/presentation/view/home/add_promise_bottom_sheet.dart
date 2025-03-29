import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/button_widget.dart';
import 'package:promise_with_me_flutter/core/componant/toast_widget.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/day_of_week_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/day_of_week_cubit.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/design_sys/sys_color.dart';
import '../../../core/design_sys/sys_text.dart';

class AddPromiseBottomSheet extends StatefulWidget {
  const AddPromiseBottomSheet({super.key});

  @override
  State<AddPromiseBottomSheet> createState() => _AddPromiseBottomSheetState();
}

class _AddPromiseBottomSheetState extends State<AddPromiseBottomSheet> {
  late final TextEditingController titleController;
  late final FocusNode titleNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    titleNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    titleNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DayOfWeekCubit(),
      child: BlocBuilder<DayOfWeekCubit, List<MapEntry<String, bool>>>(
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
                  // Title
                  SysText.bodyTiny(text: "제목"),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: SysColor.gray50,
                      border: Border.all(color: SysColor.gray100),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextField(
                      controller: titleController,
                      focusNode: titleNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'jua',
                        height: 24.sp / 20.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // DayOfWeek
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "요일 ",
                          style: TextStyle(
                            fontFamily: "jua",
                            fontSize: 16.sp,
                            height: 19.2.sp / 16.sp,
                            color: SysColor.black,
                          ),
                        ),
                        TextSpan(
                          text: "*선택하지않을시 오늘 하루만의 약속이 생겨요",
                          style: TextStyle(
                            fontFamily: "jua",
                            fontSize: 16.sp,
                            height: 19.2.sp / 16.sp,
                            color: SysColor.gray300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(state.length, (index) {
                      return DayOfWeekWidget(index: index, day: state[index]);
                    }),
                  ),

                  SizedBox(height: 40.h),

                  // Create Button
                  ButtonWidget(
                    onTap: () {
                      if (titleController.text.isNotEmpty) {
                        context.read<PromiseBloc>().add(
                          CreatePromiseEvent(
                            createPromiseRequest: CreatePromiseRequest(
                              title: titleController.text,
                              dayOfWeek:
                                  context
                                      .read<DayOfWeekCubit>()
                                      .dayOfWeekAsRequest(),
                            ),
                          ),
                        );
                        Navigators.pop(context);
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          ToastWidget(title: "제목을 입력해주세요"),
                        );
                      }
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
