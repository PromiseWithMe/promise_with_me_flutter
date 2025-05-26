import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';
import 'package:promise_with_me_flutter/presentation/view/diary/diray_detail_screen.dart';
import 'package:promise_with_me_flutter/presentation/view_model/calendar/calendar_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/calendar/calendar_event.dart';
import '../../../core/componant/image_widget.dart';
import '../../../domain/entity/calendar/calendar_entity.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final PageController _pageController;
  late DateTime _focusedDate;

  @override
  void initState() {
    super.initState();
    _focusedDate = DateTime.now();
    _pageController = PageController(initialPage: _focusedDate.month - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  CalendarEntity _getCalendarEntity(DateTime date, CalendarsEntity entity) {
    return entity.calendars.firstWhere(
      (c) => _isSameDay(DateTime.parse(c.date), date),
      orElse: () {
        return CalendarEntity(id: '', date: '', diary: '', successPromises: []);
      },
    );
  }

  void _goToMonth(DateTime newDate) {
    setState(() => _focusedDate = newDate);
    context.read<CalendarBloc>().add(
      GetCalendarEvent(
        getCalendarRequest: GetCalendarRequest(
          year: newDate.year,
          month: newDate.month,
        ),
      ),
    );
    _pageController.animateToPage(
      newDate.month - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousMonth() {
    final newDate =
        _focusedDate.month == 1
            ? DateTime(_focusedDate.year - 1, 12)
            : DateTime(_focusedDate.year, _focusedDate.month - 1);
    _goToMonth(newDate);
  }

  void _goToNextMonth() {
    final newDate =
        _focusedDate.month == 12
            ? DateTime(_focusedDate.year + 1, 1)
            : DateTime(_focusedDate.year, _focusedDate.month + 1);
    _goToMonth(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      child: BlocBuilder<CalendarBloc, BlocState<CalendarsEntity>>(
        builder: (context, state) {
          if (state is! Loaded<CalendarsEntity>) {
            return const Center(child: CircularProgressIndicator());
          }

          final calendarEntity = state.value;
          final calendar = _getCalendarEntity(_focusedDate, calendarEntity);
          final hasDiary = calendar.diary.isNotEmpty;
          final promises = calendar.successPromises;
          final count = promises.length + (hasDiary ? 1 : 0);

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SysText.bodySmall(
                    text: '${_focusedDate.year}년 ${_focusedDate.month}월',
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _goToPreviousMonth,
                        child: ImageWidget(
                          image: SysImages.arrowLeft,
                          imageWidth: 20.w,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: _goToNextMonth,
                        child: ImageWidget(
                          image: SysImages.arrowRight,
                          imageWidth: 20.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  const days = ['일', '월', '화', '수', '목', '금', '토'];
                  return Container(
                    width: 40.w,
                    alignment: Alignment.center,
                    child: SysText.bodyTiny(
                      text: days[index],
                      color: SysColor.gray300,
                    ),
                  );
                }),
              ),
              SizedBox(height: 20.h),
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (_, index) {
                    final date = DateTime(_focusedDate.year, index + 1);
                    final firstDay = DateTime(date.year, date.month, 1);
                    final daysInMonth =
                        DateTime(date.year, date.month + 1, 0).day;
                    final startOffset = firstDay.weekday % 7;

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 13.w,
                        mainAxisSpacing: 6.h,
                      ),
                      itemCount: daysInMonth + startOffset,
                      itemBuilder: (context, index) {
                        if (index < startOffset) return const SizedBox();
                        final day = index - startOffset + 1;
                        final current = DateTime(date.year, date.month, day);
                        final currentCalendar = _getCalendarEntity(
                          current,
                          calendarEntity,
                        );
                        final isSelected = _isSameDay(current, _focusedDate);
                        final hasSuccess =
                            currentCalendar.successPromises.isNotEmpty;
                        final hasDiary = currentCalendar.diary.isNotEmpty;

                        BoxDecoration decoration;
                        Color textColor;

                        if (isSelected) {
                          decoration = BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: SysColor.green200,
                              width: 3.w,
                            ),
                          );
                          textColor = Colors.black;
                        } else if (hasSuccess) {
                          decoration = BoxDecoration(
                            shape: BoxShape.circle,
                            color: SysColor.green200,
                            border: Border.all(
                              color: SysColor.green200,
                              width: 3.w,
                            ),
                          );
                          textColor = Colors.white;
                        } else {
                          decoration = BoxDecoration(
                            shape: BoxShape.circle,
                            color: SysColor.white,
                            border: Border.all(
                              color: SysColor.white,
                              width: 3.w,
                            ),
                          );
                          textColor = Colors.black;
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _focusedDate = current;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: decoration,
                                alignment: Alignment.center,
                                child: SysText.bodyMedium(
                                  text: current.day.toString(),
                                  color: textColor,
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (hasDiary) {
                                    return Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 20.w,
                                      ),
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                flex: 8,
                child: Builder(
                  builder: (context) {
                    if (count == 0) {
                      return Center(
                        child: SysText.bodyMedium(text: "등록된 약속이 없습니다."),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: count,
                        itemBuilder: (context, index) {
                          if (hasDiary && index == 0) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: GestureDetector(
                                onTap:
                                    () => Navigators.push(
                                      context,
                                      DiaryDetailScreen(
                                        diary: calendar.diary,
                                        currentDate: DateTime.parse(
                                          calendar.date,
                                        ),
                                      ),
                                    ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: SysColor.green200,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: SysText.bodyMedium(
                                    text: "일기 내용 보러가기",
                                    color: SysColor.green200,
                                  ),
                                ),
                              ),
                            );
                          }

                          final promiseIndex = hasDiary ? index - 1 : index;
                          final promise = promises[promiseIndex];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 17.h),
                              decoration: BoxDecoration(
                                color: SysColor.green100,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: SysText.bodyMedium(
                                text: promise.title,
                                color: SysColor.white,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
