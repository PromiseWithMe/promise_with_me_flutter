import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';
import '../../../core/util/dio_request_entity.dart';

class GetPromisesRequest {
  final int page;
  final DayOfWeek dayOfWeek;

  const GetPromisesRequest({required this.page, required this.dayOfWeek});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(
      queryParameters: {"page": page},
      data: {"dayOfWeek": dayOfWeek.dayOfWeek},
    );
  }
}
