import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/presentation/view/chat/widget/command_widget.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_event.dart';

import '../../../core/design_sys/sys_color.dart';
import '../../../core/design_sys/sys_text.dart';
import '../../../data/dto/chat/well_promise_request.dart';

class CommandBottomSheet extends StatefulWidget {
  final String id, title;

  const CommandBottomSheet({super.key, required this.id, required this.title});

  @override
  State<CommandBottomSheet> createState() => _CommandBottomSheetState();
}

class _CommandBottomSheetState extends State<CommandBottomSheet> {
  bool _commandToggle = false;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, List<ChatsEvent>>> commandList = [
      MapEntry("약속을 더 쉽게 지키는 법", [
        AddLocalChatEvent(content: "약속을 더 쉽게 지키는 법"),
        WellPromiseEvent(
          wellPromiseRequest: WellPromiseRequest(
            id: widget.id,
            title: widget.title,
          ),
        ),
      ]),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _commandToggle = !_commandToggle;
            });
          },
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(vertical: 15.h),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: SysColor.green200,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
            ),
            child: SysText.bodyMedium(text: "명령어보기", color: SysColor.white),
          ),
        ),
        Builder(
          builder: (context) {
            if (_commandToggle) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: commandList.length,
                itemBuilder: (context, index) {
                  return CommandWidget(
                    onTap: () {
                      _commandToggle = false;
                      for (var v in commandList[index].value) {
                        context.read<ChatsBloc>().add(v);
                      }
                    },
                    command: commandList[index].key,
                  );
                },
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
