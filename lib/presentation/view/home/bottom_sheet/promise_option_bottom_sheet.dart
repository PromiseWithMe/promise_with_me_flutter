import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/util/enum/promise_state_enum.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/data/dto/promise/change_promise_state_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/delete_promise_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promise_entity.dart';
import 'package:promise_with_me_flutter/presentation/view/home/bottom_sheet/update_promise_bottom_sheet.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/promise_option_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';

class PromiseOptionBottomSheet extends StatelessWidget {
  final PromiseEntity promise;

  const PromiseOptionBottomSheet({super.key, required this.promise});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 60.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              if (promise.promiseState == PromiseState.Completed) {
                return PromiseOptionWidget(
                  onTap: () {
                    context.read<PromiseBloc>().add(
                      ChangePromiseStateEvent(
                        promiseStateRequest: ChangePromiseStateRequest(
                          id: promise.id,
                          state: PromiseState.NotCompleted,
                        ),
                      ),
                    );
                    Navigators.pop(context);
                  },
                  image: SysImages.sad,
                  title: "성공 취소",
                );
              } else {
                return PromiseOptionWidget(
                  onTap: () {
                    context.read<PromiseBloc>().add(
                      ChangePromiseStateEvent(
                        promiseStateRequest: ChangePromiseStateRequest(
                          id: promise.id,
                          state: PromiseState.Completed,
                        ),
                      ),
                    );
                    Navigators.pop(context);
                  },
                  image: SysImages.star,
                  title: "성공했어요!",
                );
              }
            },
          ),

          SizedBox(height: 10.h),

          Builder(
            builder: (context) {
              if (promise.promiseState == PromiseState.Skip) {
                return PromiseOptionWidget(
                  onTap: () {
                    context.read<PromiseBloc>().add(
                      ChangePromiseStateEvent(
                        promiseStateRequest: ChangePromiseStateRequest(
                          id: promise.id,
                          state: PromiseState.NotCompleted,
                        ),
                      ),
                    );
                    Navigators.pop(context);
                  },
                  image: SysImages.skip,
                  title: "스킵 취소",
                );
              } else {
                return PromiseOptionWidget(
                  onTap: () {
                    context.read<PromiseBloc>().add(
                      ChangePromiseStateEvent(
                        promiseStateRequest: ChangePromiseStateRequest(
                          id: promise.id,
                          state: PromiseState.Skip,
                        ),
                      ),
                    );
                    Navigators.pop(context);
                  },
                  image: SysImages.skip,
                  title: "오늘은 스킵",
                );
              }
            },
          ),

          SizedBox(height: 10.h),

          PromiseOptionWidget(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return UpdatePromiseBottomSheet(
                    id: promise.id,
                    title: promise.title,
                    dayOfWeek: promise.dayOfWeek,
                  );
                },
              );
            },
            image: SysImages.pencil,
            title: "수정하기",
          ),

          SizedBox(height: 10.h),

          PromiseOptionWidget(
            onTap: () {
              context.read<PromiseBloc>().add(
                DeletePromiseEvent(
                  deletePromiseRequest: DeletePromiseRequest(id: promise.id),
                ),
              );
              Navigators.pop(context);
            },
            image: SysImages.trash,
            title: "삭제하기",
          ),
        ],
      ),
    );
  }
}
