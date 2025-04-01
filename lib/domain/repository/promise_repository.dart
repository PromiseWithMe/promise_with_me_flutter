import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/delete_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/change_promise_state_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/update_promise_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

abstract class PromiseRepository {
  Future<PromisesEntity> getPromises({
    required GetPromisesRequest getPromisesRequest,
  });

  Future<void> createPromise({
    required CreatePromiseRequest createPromiseRequest,
  });

  Future<void> changePromiseState({
    required ChangePromiseStateRequest promiseStateRequest,
  });

  Future<void> deletePromiseState({
    required DeletePromiseRequest deletePromiseRequest,
  });

  Future<void> updatePromiseState({
    required UpdatePromiseRequest updatePromiseRequest,
  });
}
