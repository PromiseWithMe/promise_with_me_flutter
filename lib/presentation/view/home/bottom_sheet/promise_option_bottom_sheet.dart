import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/util/enum/promise_state_enum.dart';
import 'package:promise_with_me_flutter/data/dto/promise/change_promise_state_request.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/promise_option_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';

class PromiseOptionBottomSheet extends StatelessWidget {
  final String promiseId;

  const PromiseOptionBottomSheet({super.key, required this.promiseId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 60.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PromiseOptionWidget(
            onTap:
                () => context.read<PromiseBloc>().add(
                  ChangePromiseStateEvent(
                    promiseStateRequest: ChangePromiseStateRequest(
                      id: promiseId,
                      state: PromiseState.Completed,
                    ),
                  ),
                ),
            image: SysImages.star,
            title: "완료하기",
          ),

          SizedBox(height: 10.h),

          PromiseOptionWidget(
            onTap: () {},
            image: SysImages.skip,
            title: "오늘은 스킵",
          ),

          SizedBox(height: 10.h),

          PromiseOptionWidget(
            onTap: () {},
            image: SysImages.pencil,
            title: "수정하기",
          ),

          SizedBox(height: 10.h),

          PromiseOptionWidget(
            onTap: () {},
            image: SysImages.trash,
            title: "삭제하기",
          ),
        ],
      ),
    );
  }
}
