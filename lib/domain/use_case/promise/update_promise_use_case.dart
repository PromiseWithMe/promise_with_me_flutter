import 'package:promise_with_me_flutter/data/dto/promise/update_promise_request.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';

class UpdatePromiseUseCase {
  final PromiseRepository _promiseRepository;

  const UpdatePromiseUseCase({required PromiseRepository promiseRepository})
    : _promiseRepository = promiseRepository;

  Future<void> execute({
    required UpdatePromiseRequest updatePromiseRequest,
  }) async => await _promiseRepository.updatePromiseState(
    updatePromiseRequest: updatePromiseRequest,
  );
}
