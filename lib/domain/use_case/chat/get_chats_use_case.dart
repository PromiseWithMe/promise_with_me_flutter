import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';

import '../../../data/dto/chat/get_chats_request.dart';

class GetChatsUseCase {
  final ChatRepository _chatRepository;

  const GetChatsUseCase({required ChatRepository chatRepository})
    : _chatRepository = chatRepository;

  Future<ChatsEntity> execute({
    required GetChatsRequest getChatsRequest,
  }) async => _chatRepository.getChats(getChatsRequest: getChatsRequest);
}
