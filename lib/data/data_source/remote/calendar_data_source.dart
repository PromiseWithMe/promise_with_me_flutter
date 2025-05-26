import 'package:promise_with_me_flutter/core/util/dio.dart';
import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';

class CalendarDataSource {
  Future<CalendarsEntity> getCalendar({
    required GetCalendarRequest getCalendarRequest,
  }) async {
    final request = await getCalendarRequest.toRequest();

    try {
      final response = await dio.get('/calendar', data: request.data);
      return CalendarsEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
