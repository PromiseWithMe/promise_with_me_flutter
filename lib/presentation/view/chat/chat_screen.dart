import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/componant/app_bar_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/data/dto/chat/get_chats_request.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chat_entity.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';
import 'package:promise_with_me_flutter/presentation/view/chat/command_bottom_sheet.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_event.dart';

import '../../../core/componant/image_widget.dart';
import '../../../core/design_sys/sys_images.dart';
import '../../../core/design_sys/sys_text.dart';
import '../../../core/util/navigators.dart';

class ChatScreen extends StatefulWidget {
  final String id, title;

  const ChatScreen({super.key, required this.id, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatsBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = context.read<ChatsBloc>();
    _chatBloc.add(ConnectChatEvent());

    context.read<ChatsBloc>().add(
      GetChatsEvent(getChatsRequest: GetChatsRequest(promiseId: widget.id)),
    );
  }

  @override
  void dispose() {
    _chatBloc.add(DisposeChatEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, BlocState<ChatsEntity>>(
      builder: (context, state) {
        if (state.blocState == BlocStateEnum.empty ||
            state.blocState == BlocStateEnum.loading) {
          return Center(
            child: CircularProgressIndicator(color: SysColor.green200),
          );
        } else if (state.blocState == BlocStateEnum.error) {
          return Center(child: SysText.bodyMedium(text: state.error.message));
        } else {
          return ScaffoldWidget(
            /// AppBar
            appbar: AppBarWidget(
              // app_leading
              leading: GestureDetector(
                onTap: () => Navigators.pop(context),
                child: ImageWidget(
                  image: SysImages.arrowLeft,
                  imageWidth: 18.w,
                ),
              ),

              // app_title
              title: SysText.bodyMedium(text: widget.title),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                    itemCount: state.value.chats.length,
                    itemBuilder: (context, index) {
                      final ChatEntity chat = state.value.chats[index];
                      final bool isUser = chat.role == 1;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              index == state.value.chats.length - 1 ? 200.h : 0,
                        ),
                        child: Row(
                          mainAxisAlignment:
                              isUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: isUser ? null : 1.sw - 80.h,
                              margin: EdgeInsets.only(top: 10.h),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 20.w,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isUser
                                        ? SysColor.green200
                                        : SysColor.green100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                  bottomLeft:
                                      isUser
                                          ? Radius.circular(20.r)
                                          : Radius.circular(0.r),
                                  bottomRight:
                                      !isUser
                                          ? Radius.circular(20.r)
                                          : Radius.circular(0.r),
                                ),
                              ),
                              child: SysText.bodyMedium(
                                text: state.value.chats[index].content,
                                color: SysColor.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                CommandBottomSheet(id: widget.id, title: widget.title),
              ],
            ),
          );
        }
      },
    );
  }
}
