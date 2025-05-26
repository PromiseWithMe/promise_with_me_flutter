import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';

abstract class CalendarRepository {
  Future<CalendarsEntity> getCalendar({
    required GetCalendarRequest getCalendarRequest,
  });
}
