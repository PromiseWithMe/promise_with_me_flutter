import 'package:promise_with_me_flutter/data/dto/promise/change_promise_state_request.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';

class ChangePromiseStateUseCase {
  final PromiseRepository _promiseRepository;

  const ChangePromiseStateUseCase({
    required PromiseRepository promiseRepository,
  }) : _promiseRepository = promiseRepository;

  Future<void> execute({
    required ChangePromiseStateRequest promiseStateRequest,
  }) async => await _promiseRepository.changePromiseState(
    promiseStateRequest: promiseStateRequest,
  );
}
