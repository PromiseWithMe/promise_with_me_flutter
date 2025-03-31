import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';

import '../../../core/util/dio_request_entity.dart';

class CreatePromiseRequest {
  final String title;
  final DayOfWeek dayOfWeek;

  const CreatePromiseRequest({required this.title, required this.dayOfWeek});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(
      data: {"title": title, "dayOfWeek": dayOfWeek.dayOfWeek},
    );
  }
}
