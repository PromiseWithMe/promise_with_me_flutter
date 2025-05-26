import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/presentation/view/calendar/calendar_app_bar.dart';
import 'package:promise_with_me_flutter/presentation/view/diary/diary_app_bar.dart';
import 'package:promise_with_me_flutter/presentation/view/diary/diary_screen.dart';
import 'package:promise_with_me_flutter/presentation/view/page_manager/widget/bottom_navigation_item.dart';
import 'package:promise_with_me_flutter/presentation/view_model/page_manager/page_index_cubit.dart';

import '../../../core/componant/app_bar_widget.dart';
import '../calendar/calendar_screen.dart';
import '../home/home_screen.dart';
import '../home/home_app_bar.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: context.read<PageIndexCubit>().state,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> appBarData = [
      const HomeAppBar(),
      const DiaryAppBar(),
      const CalendarAppBar(),
    ];

    final List<Widget> screenData = [
      const HomeScreen(),
      const DiaryScreen(),
      const CalendarScreen(),
    ];

    return BlocBuilder<PageIndexCubit, int>(
      builder: (context, state) {
        return ScaffoldWidget(
          appbar: AppBarWidget(title: appBarData[state]),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: screenData,
          ),
          bottomNavigationBar: Container(
            height: 64.h,
            color: SysColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                  state: state,
                  pageController: pageController,
                  label: "홈",
                  clickState: 0,
                  selectedImage: SysImages.houseFilled,
                  image: SysImages.house,
                ),
                BottomNavigationItem(
                  state: state,
                  pageController: pageController,
                  label: "일기",
                  clickState: 1,
                  selectedImage: SysImages.documentFilled,
                  image: SysImages.document,
                ),
                BottomNavigationItem(
                  state: state,
                  pageController: pageController,
                  label: "기록",
                  clickState: 2,
                  selectedImage: SysImages.calendarFilled,
                  image: SysImages.calendar,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
