import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';

class DisposeChatUseCase {
  final ChatRepository _chatRepository;

  const DisposeChatUseCase({required ChatRepository chatRepository})
    : _chatRepository = chatRepository;

  Stream<String> get chat => _chatRepository.chat;

  Future<void> execute() async => await _chatRepository.disposeChat();
}
