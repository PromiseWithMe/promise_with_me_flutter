import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';

import '../../../data/dto/chat/well_promise_request.dart';

class WellPromiseUseCase {
  final ChatRepository _chatRepository;

  const WellPromiseUseCase({required ChatRepository chatRepository})
    : _chatRepository = chatRepository;

  Stream<String> get chat => _chatRepository.chat;

  Future<void> execute({required WellPromiseRequest wellPromiseRequest}) async {
    await _chatRepository.wellPromise(wellPromiseRequest: wellPromiseRequest);
  }
}
