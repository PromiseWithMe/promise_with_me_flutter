import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';

class CreatePromiseUseCase {
  final PromiseRepository _promiseRepository;

  const CreatePromiseUseCase({required PromiseRepository promiseRepository})
    : _promiseRepository = promiseRepository;

  Future<void> execute({
    required CreatePromiseRequest createPromiseRequest,
  }) async => await _promiseRepository.createPromise(
    createPromiseRequest: createPromiseRequest,
  );
}
