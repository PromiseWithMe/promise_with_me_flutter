import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:promise_with_me_flutter/core/util/dio.dart';
import 'package:promise_with_me_flutter/data/dto/chat/well_promise_request.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';

import '../../../core/util/socket.dart';
import '../../dto/chat/get_chats_request.dart';

class ChatDataSource {
  late StreamController<String> _chatStreamController;

  Stream<String> get chat => _chatStreamController.stream.asBroadcastStream();

  Future<void> connectChat({
    required StreamController<String> chatStreamController,
  }) async {
    _chatStreamController = chatStreamController;

    socket.connect();

    socket.on('wellPromiseResponse', (data) {
      if (!_chatStreamController.isClosed) {
        _chatStreamController.sink.add(data);
      }
    });

    socket.on('exception', (error) {
      if (!_chatStreamController.isClosed) {
        _chatStreamController.sink.addError(error ?? 'Unknown socket error');
      }
    });
  }

  Future<void> disposeChat() async {
    socket.off('wellPromiseResponse');
    socket.off('exception');
    socket.disconnect();

    await _chatStreamController.close();
  }

  Future<void> wellPromise({
    required WellPromiseRequest wellPromiseRequest,
  }) async {
    try {
      socket.emit('wellPromise', {
        "promiseId": wellPromiseRequest.id,
        "message": wellPromiseRequest.title,
      });
    } catch (e, stackTrace) {
      debugPrint('wellPromise 전송 오류: $e\n$stackTrace');
      if (!_chatStreamController.isClosed) {
        _chatStreamController.sink.addError(e);
      }
    }
  }

  Future<ChatsEntity> getChats({
    required GetChatsRequest getChatsRequest,
  }) async {
    try {
      final request = await getChatsRequest.toRequest();

      final response = await dio.get('/chat/${request.id}');

      return ChatsEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
