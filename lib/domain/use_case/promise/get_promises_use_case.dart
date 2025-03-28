import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';

import '../../../data/dto/promise/get_promises_request.dart';

class GetPromisesUseCase {
  final PromiseRepository _promiseRepository;

  const GetPromisesUseCase({required PromiseRepository promiseRepository})
    : _promiseRepository = promiseRepository;

  Future<PromisesEntity> execute({
    required GetPromisesRequest getPromisesRequest,
  }) async => await _promiseRepository.getPromises(
    getPromisesRequest: getPromisesRequest,
  );
}
