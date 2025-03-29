import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

import '../../core/util/dio.dart';

class PromiseDataSource {
  Future<PromisesEntity> getPromises({
    required GetPromisesRequest getPromisesRequest,
  }) async {
    try {
      final request = await getPromisesRequest.toDioRequest();

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
}
