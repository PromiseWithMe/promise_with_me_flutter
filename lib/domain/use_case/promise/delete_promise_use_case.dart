import 'package:promise_with_me_flutter/data/dto/promise/delete_promise_request.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';

class DeletePromiseUseCase {
  final PromiseRepository _promiseRepository;

  const DeletePromiseUseCase({required PromiseRepository promiseRepository})
    : _promiseRepository = promiseRepository;

  Future<void> execute({
    required DeletePromiseRequest deletePromiseRequest,
  }) async => await _promiseRepository.deletePromiseState(
    deletePromiseRequest: deletePromiseRequest,
  );
}
