import 'dart:async';

import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';

import '../../data/dto/chat/get_chats_request.dart';
import '../../data/dto/chat/well_promise_request.dart';

abstract class ChatRepository {
  Stream<String> get chat;

  Future<void> connectChat({
    required StreamController<String> chatStreamController,
  });

  Future<void> disposeChat();

  Future<void> wellPromise({required WellPromiseRequest wellPromiseRequest});

  Future<ChatsEntity> getChats({required GetChatsRequest getChatsRequest});
}
