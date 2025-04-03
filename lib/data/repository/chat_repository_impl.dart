import 'dart:async';

import 'package:promise_with_me_flutter/data/data_source/remote/chat_data_source.dart';
import 'package:promise_with_me_flutter/data/dto/chat/get_chats_request.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';

import '../dto/chat/well_promise_request.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource _chatDataSource;

  const ChatRepositoryImpl({required ChatDataSource chatDataSource})
    : _chatDataSource = chatDataSource;

  @override
  Stream<String> get chat => _chatDataSource.chat.asBroadcastStream();

  @override
  Future<void> connectChat({
    required StreamController<String> chatStreamController,
  }) async {
    await _chatDataSource.connectChat(
      chatStreamController: chatStreamController,
    );
  }

  @override
  Future<void> disposeChat() async {
    await _chatDataSource.disposeChat();
  }

  @override
  Future<void> wellPromise({
    required WellPromiseRequest wellPromiseRequest,
  }) async {
    await _chatDataSource.wellPromise(wellPromiseRequest: wellPromiseRequest);
  }

  @override
  Future<ChatsEntity> getChats({
    required GetChatsRequest getChatsRequest,
  }) async {
    return await _chatDataSource.getChats(getChatsRequest: getChatsRequest);
  }
}
