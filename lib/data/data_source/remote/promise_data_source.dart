import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

import '../../../core/util/dio.dart';
import '../../dto/promise/change_promise_state_request.dart';

class PromiseDataSource {
  Future<void> createPromise({
    required CreatePromiseRequest createPromiseRequest,
  }) async {
    try {
      final request = await createPromiseRequest.toRequest();

      await dio.post('/promise', data: request.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<PromisesEntity> getPromises({
    required GetPromisesRequest getPromisesRequest,
  }) async {
    try {
      final request = await getPromisesRequest.toRequest();

      final response = await dio.get(
        '/promise',
        data: request.data,
        queryParameters: request.queryParameters,
      );

      return PromisesEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> changePromiseState({
    required ChangePromiseStateRequest promiseStateRequest,
  }) async {
    try {
      final request = await promiseStateRequest.toRequest();

      await dio.patch('/promise/${request.id}/state', data: request.data);
    } catch (err) {
      rethrow;
    }
  }
}
