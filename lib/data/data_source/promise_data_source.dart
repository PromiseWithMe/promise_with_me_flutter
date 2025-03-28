import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';

class PromiseDataSource {
  Future<PromisesEntity> getPromises({
    required GetPromisesRequest getPromisesRequest,
  }) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    return PromisesEntity.fromJson({
      "promises": [
        {
          "id": "50f57698-8ab0-415e-9be1-ebc8189e7b2c",
          "title": "오늘의 약속1",
          "dayOfWeek": ["WED", "THU"],
          "promiseState": 1,
          "createdAt": "2025-03-25T15:00:00.000Z",
        },
        {
          "id": "a365a112-1799-4c55-bf21-a93e23799675",
          "title": "내용",
          "dayOfWeek": null,
          "promiseState": 1,
          "createdAt": "2025-03-25T15:00:00.000Z",
        },
      ],
    });
  }
}
