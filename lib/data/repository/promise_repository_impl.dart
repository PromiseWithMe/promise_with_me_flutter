import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/delete_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/change_promise_state_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/update_promise_request.dart';

import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

import '../../domain/repository/promise_repository.dart';
import '../data_source/remote/promise_data_source.dart';

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

  @override
  Future<void> changePromiseState({
    required ChangePromiseStateRequest promiseStateRequest,
  }) async {
    return await _promiseDataSource.changePromiseState(
      promiseStateRequest: promiseStateRequest,
    );
  }

  @override
  Future<void> deletePromiseState({
    required DeletePromiseRequest deletePromiseRequest,
  }) async {
    return await _promiseDataSource.deletePromises(
      deletePromiseRequest: deletePromiseRequest,
    );
  }

  @override
  Future<void> updatePromiseState({
    required UpdatePromiseRequest updatePromiseRequest,
  }) async {
    return await _promiseDataSource.updatePromise(
      updatePromiseRequest: updatePromiseRequest,
    );
  }
}
