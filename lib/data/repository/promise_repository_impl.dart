import 'package:promise_with_me_flutter/data/data_source/promise_data_source.dart';
import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';

import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

import '../../domain/repository/promise_repository.dart';

class PromiseRepositoryImpl implements PromiseRepository {
  final PromiseDataSource _promiseDataSource;

  const PromiseRepositoryImpl({required PromiseDataSource promiseDataSource})
    : _promiseDataSource = promiseDataSource;

  @override
  Future<PromisesEntity> getPromises({
    required GetPromisesRequest getPromisesRequest,
  }) async {
    return await _promiseDataSource.getPromises(
      getPromisesRequest: getPromisesRequest,
    );
  }

  @override
  Future<void> createPromise({
    required CreatePromiseRequest createPromiseRequest,
  }) async {
    return await _promiseDataSource.createPromise(
      createPromiseRequest: createPromiseRequest,
    );
  }
}
