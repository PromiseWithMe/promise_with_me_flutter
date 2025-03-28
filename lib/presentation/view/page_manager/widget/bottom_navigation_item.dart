import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/presentation/view_model/page_manager/page_index_cubit.dart';

import '../../../../core/componant/image_widget.dart';

class BottomNavigationItem extends StatelessWidget {
  final int clickState, state;
  final String label;
  final String selectedImage, image;
  final PageController pageController;

  const BottomNavigationItem({
    super.key,
    required this.label,
    required this.image,
    required this.selectedImage,
    required this.clickState,
    required this.state,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = state == clickState;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<PageIndexCubit>().change(clickState);
        pageController.animateToPage(
          clickState,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: SizedBox(
        width: (1.sw / 5).floorToDouble(),
        height: 64.h,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                image: isSelected ? selectedImage : image,
                width: 32.w,
                height: 32.h,
                color: isSelected ? SysColor.green200 : SysColor.gray300,
              ),
              SysText.bodyMini(
                text: label,
                color: isSelected ? SysColor.green200 : SysColor.gray300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
