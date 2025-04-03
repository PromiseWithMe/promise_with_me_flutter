import 'dart:async';

import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';

class ConnectChatUseCase {
  final ChatRepository _chatRepository;

  const ConnectChatUseCase({required ChatRepository chatRepository})
    : _chatRepository = chatRepository;

  Stream<String> get chat => _chatRepository.chat;

  Future<void> execute({
    required StreamController<String> chatStreamController,
  }) async {
    await _chatRepository.connectChat(
      chatStreamController: chatStreamController,
    );
  }
}
