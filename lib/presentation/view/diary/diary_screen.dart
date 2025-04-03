import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/componant/toast_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/presentation/view_model/diary/diary_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/diary/diary_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/design_sys/sys_color.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late final TextEditingController _diaryController;

  @override
  void initState() {
    super.initState();
    _diaryController = TextEditingController(
      text: context.read<DiaryBloc>().state.value,
    );
  }

  @override
  void dispose() {
    _diaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DiaryBloc, BlocState<String>>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.loaded,
          listener: (context, _) {
            showTopSnackBar(
              Overlay.of(context),
              ToastWidget(title: "저장 성공!", isError: false),
            );
          },
        ),

        BlocListener<DiaryBloc, BlocState<String>>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.error,
          listener: (context, state) {
            showTopSnackBar(
              Overlay.of(context),
              ToastWidget(title: state.error.message, isError: true),
            );
          },
        ),
      ],
      child: BlocBuilder<DiaryBloc, BlocState<String>>(
        builder: (context, state) {
          if (state.blocState == BlocStateEnum.empty ||
              state.blocState == BlocStateEnum.loading) {
            return Center(
              child: CircularProgressIndicator(color: SysColor.green200),
            );
          } else if (state.blocState == BlocStateEnum.error) {
            return Center(child: SysText.bodyMedium(text: state.error.message));
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SysText.bodyMedium(
                        text: DateFormat("yyyy.MM.dd").format(DateTime.now()),
                      ),

                      GestureDetector(
                        onTap: () {
                          context.read<DiaryBloc>().add(
                            SetDiaryEvent(data: _diaryController.text),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: SysColor.green200,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 10.w,
                          ),
                          child: SysText.bodyTiny(
                            text: "저장",
                            color: SysColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  Expanded(
                    child: TextField(
                      controller: _diaryController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '오늘의 일기를 작성해보세요!',
                        hintStyle: TextStyle(
                          fontFamily: 'jua',
                          fontSize: 18.sp,
                          height: 21.6.sp / 18.sp,
                          color: SysColor.gray300,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'jua',
                        fontSize: 18.sp,
                        height: 21.6.sp / 18.sp,
                        color: SysColor.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
