import 'package:promise_with_me_flutter/data/dto/chat/get_chats_request.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chat_entity.dart';
import '../../../data/dto/chat/well_promise_request.dart';

abstract class ChatsEvent {}

class GetChatsEvent extends ChatsEvent {
  final GetChatsRequest getChatsRequest;

  GetChatsEvent({required this.getChatsRequest});
}

class AddLocalChatEvent extends ChatsEvent {
  final String content;

  AddLocalChatEvent({required this.content});
}

class ConnectChatEvent extends ChatsEvent {}

class DisposeChatEvent extends ChatsEvent {}

class WellPromiseEvent extends ChatsEvent {
  final WellPromiseRequest wellPromiseRequest;

  WellPromiseEvent({required this.wellPromiseRequest});
}
