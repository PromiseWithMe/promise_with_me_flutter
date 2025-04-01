import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_text.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';
import 'package:promise_with_me_flutter/presentation/view/home/widget/promise_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_filter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _promiseScrollController;

  @override
  void initState() {
    super.initState();
    _promiseScrollController =
        ScrollController()..addListener(() {
          if (_promiseScrollController.position.pixels ==
                  _promiseScrollController.position.maxScrollExtent &&
              context.read<PromiseBloc>().state.value.promises.length % 10 ==
                  0) {
            context.read<PromiseBloc>().add(
              GetPromisesEvent(
                getPromisesRequest: GetPromisesRequest(
                  page:
                      context.read<PromiseBloc>().state.value.promises.length ~/
                      10,
                  dayOfWeek:
                      context.read<PromiseFilterCubit>().dayOfWeekAsRequest(),
                ),
              ),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _promiseScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromiseBloc, BlocState<PromisesEntity>>(
      builder: (context, state) {
        if (state.blocState == BlocStateEnum.empty ||
            state.blocState == BlocStateEnum.loading) {
          return Center(
            child: CircularProgressIndicator(color: SysColor.green200),
          );
        } else if (state.blocState == BlocStateEnum.error) {
          return Center(child: SysText.bodyMedium(text: state.error.message));
        } else {
          if (state.value.promises.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SysText.bodyMedium(text: "스스로에게 의미 있는 할 일을 만들어보세요."),
                SysText.bodyMedium(text: "첫 번째 할 일을 기록해볼까요?"),
              ],
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: ListView.builder(
                controller: _promiseScrollController,
                itemCount: state.value.promises.length,
                itemBuilder: (context, index) {
                  return PromiseWidget(promise: state.value.promises[index]);
                },
              ),
            );
          }
        }
      },
    );
  }
}
