import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';

import '../../../core/util/dio_request_entity.dart';

class UpdatePromiseRequest {
  final String id, title;
  final DayOfWeek dayOfWeek;

  const UpdatePromiseRequest({
    required this.id,
    required this.title,
    required this.dayOfWeek,
  });

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(
      id: id,
      data: {"title": title, "dayOfWeek": dayOfWeek.dayOfWeek},
    );
  }
}
